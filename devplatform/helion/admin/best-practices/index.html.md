---
layout: default-devplatform
permalink: /als/v1/admin/best-practices/
product: devplatform
---
<!--PUBLISHED-->

Best Practices[](#index-0 "Permalink to this headline")
========================================================

Applying Updates {#applying-updates}
-------------------------------------------------------------------
[Applying Updates](#applying-updates)
    -   [Backup & Migration](#backup-migration)
        -   [Limitations](#limitations)
            -   [Custom Services](#custom-services)
            -   [Hard-coded Database Connection
                Info](#hard-coded-database-connection-info)
            -   [DEAs](#deas)
        -   [Exporting the server data](#exporting-the-server-data)
        -   [Scheduled backups](#scheduled-backups)
        -   [Importing the server data](#importing-the-server-data)
    -   [Upgrading (v1.0 and later)](#upgrade)
    -   [Server Monitoring with New
        Relic](#server-monitoring-with-new-relic)
    -   [System Monitoring with Nagios](#system-monitoring-with-nagios)
    -   [Persistent Storage](#storage)
        -   [Relocating Services, Droplets, and
            Containers](#relocating-services-droplets-and-containers)
        -   [Enabling Filesystem Quotas](#enabling-filesystem-quotas)


Major version upgrades of Application Lifecycle Service can be done using [*kato node
upgrade*](/als/v1/admin/server/upgrade/#upgrade) or a [*migration to a new VM
or cluster*](#bestpractices-migration), but patch releases (normally
minor fixes to particular components) can be applied in place using the
[*kato patch*](/als/v1/admin/reference/kato-ref/#kato-command-ref-patch)
command.

To see a list of patches available from HP, run the following
command on any Application Lifecycle Service VM:

    $ kato patch status

The command will list the updates available. For example:

    2 updates available to be installed.

    Known updates:
      dea-memory-usage-reporting: Fix the reporting of helion stats usage on the DEA end.
        severity: required
        roles affected: dea

      vsphere-autoscaling-fix: Fix VSphere autoscaling behavior.
        severity: required
        roles affected: controller, primary

To apply all patches to all relevant cluster nodes:

    $ kato patch install

To apply a particular patch, specify it by name:

    $ kato patch install dea-memory-usage-reporting

Applying patches will automatically restart all patched roles. To
prevent this, use the `--no-restart` option.

To apply a patch only to the local Application Lifecycle Service VM (not the whole cluster),
use the `--only-this-node` option.

Backup & Migration {#backup-migration}
---------------------------------------------------------------------

This section describes backing up Application Lifecycle Service data and importing it into a
new Application Lifecycle Service system. The export/import cycle is required for:

-   backups of system data
-   moving an Application Lifecycle Service cluster to a new location

### Limitations[](#limitations "Permalink to this headline")

Before deciding on a backup, upgrade or migration strategy, it's
important to understand what data the Application Lifecycle Service system can save, and what
may have to be reset, redeployed, or reconfigured. This is especially
important when migrating to a new cluster.

#### Custom Services[](#custom-services "Permalink to this headline")

Application Lifecycle Service can export and import data from built-in data services running
on Application Lifecycle Service nodes, but it has no mechanism to handle data in [*external
databases*](/als/v1/admin/cluster/external-db/#external-db) (unless
`kato export|import` has also been modified to
recognize the custom service).

Backing up or moving such databases should be handled separately, and
user applications should be reconfigured and/or redeployed to connect
properly to the new database host if the database is not implemented as
an Application Lifecycle Service data service.

#### Hard-coded Database Connection Info[](#hard-coded-database-connection-info "Permalink to this headline")

Applications which write database connection details during staging
rather than taking them from environment variables at run time, must be
re-staged (e.g. redeployed or updated) to pick up the new service
location and credentials. Restarting the application will not
automatically force restaging.

#### DEAs[](#deas "Permalink to this headline")

Droplet Execution Agent (DEA) nodes are not migrated directly from old
nodes to new nodes. Instead, the application droplets (zip files
containing staged applications) are re-deployed to new DEA nodes from
the Controller.

### Exporting the server data[](#exporting-the-server-data "Permalink to this headline")

Data export is done with the [*kato data
export*](/als/v1/admin/reference/kato-ref/#kato-command-ref-data-export)
command. The command can export:

-   internal Application Lifecycle Service data (users, groups, quotas, settings, etc.)
-   application droplets
-   data services

Start by logging into the VM via `ssh`:

    $ ssh helion@helion-xxxx.local

A single-node micro cloud VM can be backed up with a single command:

    $ kato data export --only-this-node

A clustered setup can be backed up with a single command:

    $ kato data export --cluster

Once the export completes, you can use
[scp](http://manpages.ubuntu.com/manpages/lucid/man1/scp.1) or
another utility (e.g. sftp, rsync) to move the .tgz file to another
system, or save the file directly to a mounted external filesystem by
specifying the full path and filename during export (see backup example
below).

**Note**

Exporting data can take several minutes. For clusters with constant
usage or large numbers of users, apps, and databases, put the exporting
system in [*Maintenance Mode*](/als/v1/admin/console/customize/#console-settings)
(e.g. during a scheduled maintenance window) before exporting.

### Scheduled backups[](#scheduled-backups "Permalink to this headline")

Regular backup of controller data, apps, droplets, and service data is
recommended for any production system. Implementation of a regular
backup routine is left to the discretion of the Application Lifecycle Service administrator,
but using
[cron/crontab](http://manpages.ubuntu.com/manpages/oneiric/man1/crontab.1)
is one simple way is to automate this. For example, you could create an
entry like the following in the root user's crontab on the filesystem
node:

    0 3 * * * su - helion /bin/bash -c '/home/helion/bin/kato data export --cluster /mnt/nas/helion-backup.tgz'

This runs `kato data export --cluster` every morning
at 3AM as `root` using the `helion` user's login environment (required) and saves a .tgz file to a
mounted external filesystem.

Scheduled (non-interactive) backups using the `kato export` command will need to be run by `root` as
some shell operations performed in the export require `sudo` when run interactively. For clusters, passwordless [SSH key
authentication](https://help.ubuntu.com/community/SSH/OpenSSH/Configuring#disable-password-authentication)
between the Core node and all other nodes will also need to be set up.
The command should be run on the node hosting the 'filesystem' role, as
some shell commands need to be run locally for that service.

### Importing the server data[](#importing-the-server-data "Permalink to this headline")

To import Application Lifecycle Service data, transfer the exported .tgz file to the target
VM or note the hostname of the old VM / Core node.

**Note**

Before importing data to a new microcloud or cluster, make sure you have
completed first-user (admin) setup in the Application Lifecycle Service Web UI and accepted
the terms and conditions.

**Note**

All roles in the new cluster should be started prior to proceeding with
import. If you would like all services to be imported, their
corresponding roles must be enabled (see also [*Importing Apps using
RabbitMQ
2.4*](/als/v1/admin/reference/known-issues/#known-issues-rabbit-import)).

Login to the Application Lifecycle Service VM (or Core node) and run
`kato data import` with the relevant options. For
example, to import all data into a new cluster from a .tgz file:

    $ kato data import --cluster helion-export-xxxxxxxxxx.tgz

To import data from a running Application Lifecycle Service system instead, specify the
hostname of the old Core node:

    $ kato data import --cluster helion-host.example.com

##Upgrading (v1.0 and later) {#upgrade}


The `kato node upgrade` command was added in
Application Lifecycle Service 1.0 to allow upgrading Application Lifecycle Service systems in place. See
[*Upgrading Application Lifecycle Service*](/als/v1/admin/server/upgrade/#upgrade) for full
instructions.

Server Monitoring with New Relic[](#server-monitoring-with-new-relic "Permalink to this headline")
---------------------------------------------------------------------------------------------------

To use New Relic for server monitoring, you'll need a [New Relic
account](http://newrelic.com/) and a License Key. Install the
`newrelic-sysmond` package and start the monitoring
daemon on each Application Lifecycle Service VM as per the [New Relic Server Monitor
installation
(Ubuntu)](http://docs.newrelic.com/docs/server/server-monitor-installation-ubuntu-and-debian)
instructions.

System Monitoring with Nagios[](#system-monitoring-with-nagios "Permalink to this headline")
---------------------------------------------------------------------------------------------

Though Application Lifecycle Service has an internal mechanism for supervising processes on a
server or cluster ([Supervisor](http://supervisord.org/)), it is
advisable to add some external monitoring for production systems.
[Nagios](http://www.nagios.org/) is a free, open source system
monitoring tool that can provide this external monitoring.

Detailed instructions on installing and configuring Nagios can be found
in the [Nagios Core
Documentation](http://nagios.sourceforge.net/docs/3_0/toc)

##Persistent Storage {#storage}

Cloud hosting providers have different default partition sizes and
configurations. The default root volumes on some cloud hosted VM
instances are often fairly small and are usually ephemeral. Data service
and filesystem nodes should always be backed by some kind of persistent
storage, with enough free filesystem space to accommodate the projected
use of the services.

### Relocating Services, Droplets, and Containers[](#relocating-services-droplets-and-containers "Permalink to this headline")

To move database services, application droplets, and application
containers to larger partitions:

-   mount the filesystem and/or block storage service on the instance
    (with [*quotas enabled*](#bestpractices-filesystem-quotas)),
-   create directories for the items you wish to move,
-   run the [*kato
    relocate*](/als/v1/admin/reference/kato-ref/#kato-command-ref-relocate)
    command(s).

For example:

    $ kato stop
    ...
    $ kato relocate services /mnt/ebs/services
    ...
    $ kato relocate droplets /mnt/ebs/droplets
    ...
    $ kato relocate containers /mnt/containers
    ...

**Note**

For performance reasons, Application Lifecycle Service containers should not be relocated to
block volumes.

### Enabling Filesystem Quotas[](#enabling-filesystem-quotas "Permalink to this headline")

The Application Lifecycle Service filesystem quotas cannot be enforced by the system unless
they are mounted on partitions which support Linux quotas. This may need
to be specified explicitly when running the `mount`
command. The [*kato
relocate*](/als/v1/admin/reference/kato-ref/#kato-command-ref-relocate) command
will warn if this is necessary.

For the example above, the `mount` step might look
like this:

    $ sudo mount -o remount,usrjquota=aquota.user,grpjquota=aquota.group,jqfmt=vfsv0 /mnt/containers
    $ sudo quotacheck -vgumb /mnt/containers
    $ sudo quotaon -v /mnt/containers

To ensure the quotas are preserved after reboot, edit
*/etc/init.d/setup\_helion\_lxc* to include mount commands for each
partition. The example above would require a block such as this:

    # enable quotas for Application Lifecycle Service containers
    if [[ -f "/mnt/containers/aquota.user" ]]; then
      mount -o remount,usrjquota=aquota.user,grpjquota=aquota.group,jqfmt=vfsv0 /mnt/containers
      quotaon -v /mnt/containers
    fi


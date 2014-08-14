---
layout: default-devplatform
permalink: /als/v1/admin/console/
---
<!--PUBLISHED-->

Management Console (Admin View)[](#management-console-admin-view "Permalink to this headline")
===============================================================================================

Application Lifecycle Service's web interface is called the Management Console. The interface
displays more options and settings for Admin users than it does for
regular end users. Some of the features described below are only
available in the Admin view.

### [Table Of Contents](/als/v1/index-2/)

-   [About the Admin Console](#about)
    -   [Welcome](#welcome)
        -   [System Information](#system-information)
    -   [Cluster Nodes](#cluster-nodes)
    -   [Organizations](#organizations)
    -   [Users](#users)
    -   [Applications](#applications)
    -   [Cloud Events](#cloud-events)
    -   [Dashboard](#dashboard)
        -   [Router](#router)
        -   [Primary Node Status Graphs](#primary-node-status-graphs)
    -   [Settings](#settings)
        -   [Console](#console)
        -   [Quota Definitions](#quota-definitions)
        -   [Cloud Controller](#cloud-controller)
        -   [Applications](#console-settings-applications)
        -   [DEA](#dea)
        -   [Logyard](#logyard)
        -   [Harbor](#harbor)
        -   [Data Services](#data-services)
        -   [File System](#file-system)

About the Admin Console[](#about "Permalink to this headline")
-------------------------------------------------


The Application Lifecycle Service Management Console is a web interface that allows the
administration and management of the Application Lifecycle Service Server.

Your hypervisor provides [*tty
console*](/als/v1/user/reference/glossary/#term-tty-console) access to
each of its virtual machines. After startup, an Application Lifecycle Service VM displays:

    Application Lifecycle Service Management Console at

    https://helion-xxxx.local

On a [*micro
cloud*](/als/v1/user/reference/glossary/#term-micro-cloud) VM where
the local network supports [*multicast
DNS*](/als/v1/user/reference/glossary/#term-multicast-dns), the
hostname will be `helion-xxxx.local`. If you have
configured the
[*hostname*](/als/v1/admin/server/configuration/#server-config-hostname) and
[*DNS*](/als/v1/admin/server/configuration/#server-config-dns) of the Application Lifecycle Service
server manually, or are connecting to a server administered by someone
else, supply the assigned hostname instead (e.g.
`api.helion-test.example.com`).

Enter the URL into your web browser, and the Management Console will
load. The Console is supported on the following browsers:

-   Chrome 30+ (WebKit)
-   Firefox 20+
-   IE 10+

Using a browser which fully support WebSockets is recommended.

**Note**

The SSL certificate for the Application Lifecycle Service Management Console is self-signed.
You will need to manually accept this certificate in your browser. See
the [*HTTPS section*](/als/v1/admin/server/configuration/#server-config-https)
for information on using your own certificate.

When you first access the Management Console, you will be prompted to
create a primary administrative user for Application Lifecycle Service. Enter an email
address as the username, set a secure password, then review and accept
the license agreement.

**Note**

**The password you choose here becomes the login password for the**
`helion` **user on the VM** (e.g. for
`ssh` access).

Once you've logged in, you can begin to add other users and admins,
enable and disable services, and generally set up the system to your
requirements.

Basic Application Lifecycle Service administration can be done through the Management
Console, but some maintenance and configuration tasks may need to be
done at the command line using the `kato` command.
See [*Kato Command
Reference*](/als/v1/admin/reference/kato-ref/#kato-command-ref) for a full list
of options.

The Application Lifecycle Service Management Console will periodically send non-identifying
pingbacks (Application Lifecycle Service version number and UUID) to HP
servers to help us improve the web console experience. You can disable
this by setting `theme_settings['pingback_allowed'] = false;`{.docutils
.literal} in the *settings.js* file described in the [*Theming and
Customization*](/als/v1/admin/console/customize/#customize) section.

Welcome[](#welcome "Permalink to this headline")
-------------------------------------------------

The top-level page of the Management Console displays quick links to the
most used resources and views. The blue buttons are for features also
available for regular end users (see [*Management Console (User
View)*](/als/v1/user/console/#user-console-welcome)).

Green buttons expose Admin-only functionality:

-   **Configure Available Services**: Opens the [*Cluster
    Nodes*](#console-cluster-nodes) view showing which roles are running
    on which nodes. From this view you can add or remove Service roles
    on the various nodes in the cluster (or on 127.0.0.1 for micro
    clouds).
-   **Manage Organizations**: Opens the
    [*Organizations*](#console-organizations) view.
-   **Manage Users**: Opens the [*Users*](#console-users) view.
-   **View All Deployed Applications**: Opens the :ref: Applications
    \<console-applications\> view.
-   **View Cloud Events**: Opens the Cloud Events
    \<console-cloud-events\> view.
-   **View Dashboard**: Opens the Dashboard \<console-dashboard\>.

### System Information[](#system-information "Permalink to this headline")

-   **Version**: Version (release) number of the system.
-   **MBUS IP**: The IP address that hosts the primary node. Cluster
    nodes (if any) will connect via this IP address. In a micro cloud
    setting, it will be 127.0.0.1.
-   **API Endpoint**: The URL for helion clients to target. Normally
    also the URL for the Management Console.

Cluster Nodes[](#cluster-nodes "Permalink to this headline")
-------------------------------------------------------------

Displays a list of nodes in the current cluster, and what services are
running on each node. In a micro cloud configuration, only the current
local node ('127.0.0.1') is shown.

To enable or disable services on a node, click the **Configure Roles**
button (cog icon) to see the **Node Settings**, showing a list of all
available roles and checkboxes to enable or disable each one. Click
**Save** to apply changes.

See also the [*kato
role*](/als/v1/admin/reference/kato-ref/#kato-command-ref-role-add) and [*kato
info*](/als/v1/admin/reference/kato-ref/#kato-command-ref-info) command
documentation for the CLI equivalents, and the [*Cluster
Setup*](/als/v1/admin/cluster/#cluster-setup) section for information on
adding nodes to the cluster.

Organizations[](#organizations "Permalink to this headline")
-------------------------------------------------------------

The top level Organizations page allows Admins to add and delete
[*Organizations*](/als/v1/user/deploy/orgs-spaces/#orgs-spaces).
Clicking on an organization name opens its details. This view is the
same as a regular [*user's Organizations
view*](/als/v1/user/console/#user-console-organizations), but
admin users can edit quotas, and add/remove domains, spaces, and users.

Users[](#users "Permalink to this headline")
---------------------------------------------

The Users section displays a list of users and admins.

-   Click **+ Add User** to add users.
-   Click on the user name or email address to view account details or
    change the password.

Applications[](#applications "Permalink to this headline")
-----------------------------------------------------------

The Applications section displays a list of all apps on the server.
Click anywhere on the line for an app to view its details. Admins have
the same permissions in the [*Application
View*](/als/v1/user/console/#user-console-app) as a Developer of
the space it was deployed to.

Cloud Events[](#cloud-events "Permalink to this headline")
-----------------------------------------------------------

The Cloud Events section displays a list of events (including errors and
warnings) on the Application Lifecycle Service server. The events can be filtered by Severity
or Type, or by using a substring match in the Search field.

Dashboard[](#dashboard "Permalink to this headline")
-----------------------------------------------------

### Router[](#router "Permalink to this headline")

Shows realtime results for incoming requests (connections per second),
routing errors (errors per second), and an overview of the cumulative
requests to the system.

### Primary Node Status Graphs[](#primary-node-status-graphs "Permalink to this headline")

Displays graphs for server statistics: CPU, Load, Memory, Disk
Operations, Disk Space, Processes, and Swap (primary node or micro cloud
only).

Settings[](#settings "Permalink to this headline")
---------------------------------------------------

The Settings menu gives access to the following Console and system
settings:

### Console[](#console "Permalink to this headline")

Various settings and templates to customize the look and feel of the
Management Console. The settings are divided into the following
categories:

-   **Product**: Options to rename and reversion Application Lifecycle Service for OEM
    deployments, change the default locale (currently only 'en' and 'de'
    available), choose a different URL for documentation, or disable
    console pingbacks.
-   **Look and Feel**: Change the favicon, header, footer, or background
    color.
-   **Welcome Page**: EJS templated HTML to display on the Welcome page
    (see above).
-   **Support Page**: EJS templated HTML to display on the Support page.
    Change this if you are supporting your end users directly.
-   **Eula Content**: End User License Agreement. Change this if you are
    exposing Application Lifecycle Service to end users under specific terms.
-   **Custom Stylesheet**: A single CSS file used to override any
    existing styling in the Management Console. Inspect the Console with
    browser tools such as Firebug or Chrome Developer Tools to see the
    class names and IDs.

### Quota Definitions[](#quota-definitions "Permalink to this headline")

**Note**

In Application Lifecycle Service 2.10 and earlier, every User and Group had a quota. In 3.0
(Cloud Foundry v2) Quota Definitions are applied at the Organization
level (i.e. members of an organizations share its quota).

Lists the Quota Definitions available to apply to Organizations on the
system.

-   To edit a definition, click the edit button on the right.
-   To create a new definition use the [*helion quota
    create*](/als/v1/user/reference/client-ref/#command-quota-create)
    command.

### Cloud Controller[](#cloud-controller "Permalink to this headline")

-   **Maintenance Mode**: Shuts down API requests but continues to serve
    web requests, useful when performing system operations such as
    importing and exporting data for upgrades. When the primary node
    enters maintenance mode, the Management Console becomes "read only"
    with the exception of this toggle (to bring it back online).
-   **Logging Level**: Changes the verbosity of Application Lifecycle Service logs from
    'debug2' (most verbose) through 'off' (silent).
-   **Support Email**: The email address displayed to end users when
    errors are encountered. Use an address which is monitored by
    Application Lifecycle Service administrators.
-   **App Store URLs**: URIs for JSON files which populate the [*App
    Store*](app-store.html#app-store). The URIs need not be public, but
    must be accessible from the controller node.
-   **Allowed Repos**: Debian package repositories allowed in
    application containers. End users can install additional packages
    (e.g. with `apt-get` or `aptitude`{.docutils
    .literal}) only from these repositories.

### Applications[](#console-settings-applications "Permalink to this headline")

-   **Reserved URIs**: URIs which cannot be used for end user
    applications.

### DEA[](#dea "Permalink to this headline")

-   **Max Memory Percentage**: The percentage of physical memory each
    DEA node can use for hosted applications. The 80% default setting
    leaves enough memory for the OS and DEA processes on a node with 4GB
    of RAM. This can be increased on nodes with more memory available
    (e.g. to 90% on a node with 8GB of RAM). Do not exceed 100% unless
    the system correctly supports swap space and has it enabled. Restart
    all DEA roles/nodes to apply the change.
-   **Max Staging Duration**: The maximum time allowed for application
    staging.

### Logyard[](#logyard "Permalink to this headline")

Lists current log
[*Drains*](/als/v1/admin/server/logging/#logging-drains-system) and the log
drain retry limits. Drains and limits cannot be changed in this
interface; use the [*kato log drain
...*](/als/v1/admin/reference/kato-ref/#kato-command-ref-log-drain-add)
commands and [*kato config
...*](/als/v1/admin/reference/kato-ref/#kato-command-ref-config) commands.

### Harbor[](#harbor "Permalink to this headline")

Settings for the [*Harbor*](/als/v1/admin/cluster/harbor/#harbor) TCP/UDP port
service.

-   **External Host**: The public IP (if configured) for the Harbor
    node.
-   **External Hostname**: The public hostname for the Harbor node.
-   **Port Range Minimum**: Sets the minimum for the exposed port range
    (default: 35000).
-   **Port Range Maximum**: Sets the maximum for the exposed port range
    (default: 40000).

See [*Harbor: Requirements &
Setup*](/als/v1/admin/cluster/harbor/#harbor-setup) for more information.

### Data Services[](#data-services "Permalink to this headline")

-   **Allow Over-provisioning**: Ignore the Capacity setting.
-   **Capacity**: Maximum number of service slots to allocate.
-   **Max DB size**: Maximum size on disk for database services.
-   **Max Memory**: Maximum amount of physical memory to allocate the
    service.
-   **Memcached Memory**: Maximum amount of physical memory to allocate
    for memcached instances.
-   **Max FS Size**: Maximum size on disk for filesystem services.

### File System[](#file-system "Permalink to this headline")

-   **Capacity**: Maximum number of service slots to allocate.
-   **Max FS Size**: Maximum size on disk for filesystem services in MB.
-   **Allow Over-provisioning**: Ignore the Capacity setting.



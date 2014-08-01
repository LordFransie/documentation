---
layout: default-devplatform
permalink: /als/v1/admin/server/
---
<!--PUBLISHED-->

Server Configuration[](#server-configuration "Permalink to this headline")
===========================================================================

This page covers the initial setup and configuration of the Application Lifecycle Service
Server in a virtual machine under control of a hypervisor running on a
virtualization host.

Accessing Server via the Command Line[](#accessing-server-via-the-command-line "Permalink to this headline")
-------------------------------------------------------------------------------------------------------------

The Application Lifecycle Service server has one user account initally:

    Username: helion
    Password: helion

If the Application Lifecycle Service server is running on a publicly routable network, the
password should be changed as soon as possible.

**Note**

The password of the `helion` account is changed to
match the first user created in the Management Console. If you've
created this "primary admin" user, use that password instead.

Command access to the Application Lifecycle Service server is available in several ways:

-   Over the hypervisor's [*tty
    console*](/als/v1/user/reference/glossary/#term-tty-console).

-   The [*Application Lifecycle Service
    Client*](/als/v1/user/reference/client-ref/#command-ref-client)
    command, which in addition to specialized functions can provide
    remote shell access to the server:

        $ helion target helion@helion-xxxx.local
        $ helion ssh api

-   The familiar `ssh` command:

        $ ssh helion@helion-xxxx.local

**Note**

For ssh access on Windows, we recommend
[MSYS](http://sourceforge.net/apps/trac/mingw-w64/wiki/MSYS).

On the server, the control command for Application Lifecycle Service is called
`kato`. It is used for configuration and node
management procedures such as start, stop, role specialization, and
status checks. For a complete list of options, see [*Kato Command
Reference*](/als/v1/admin/reference/kato-ref/#kato-command-ref).

Common Operations[](#common-operations "Permalink to this headline")
---------------------------------------------------------------------

Instructions for common operations on the Application Lifecycle Service VM can be found here:

-   [Common Server Operations](/als/v1/admin/server/operations/)
    -   [Server Status](/als/v1/admin/server/operations/#server-status)
        -   [Starting and Stopping
            Roles](/als/v1/admin/server/operations/#starting-and-stopping-roles)
        -   [System Shutdown](/als/v1/admin/server/operations/#system-shutdown)
    -   [Setting the Time Zone](/als/v1/admin/server/operations/#setting-the-time-zone)
    -   [Resetting the VM](/als/v1/admin/server/operations/#resetting-the-vm)
    -   [Monitoring The Application Lifecycle Service
        Server](/als/v1/admin/server/operations/#monitoring-the-helion-server)
        -   [Management Console](/als/v1/admin/server/operations/#management-console)
        -   [New Relic](/als/v1/admin/server/operations/#new-relic)
        -   [Creating an Admin
            User](/als/v1/admin/server/operations/#creating-an-admin-user)
        -   [System Monitoring with
            Nagios](/als/v1/admin/server/operations/#system-monitoring-with-nagios)
    -   [Server Backup, Import, and
        Export](/als/v1/admin/server/operations/#server-backup-import-and-export)
-   [Upgrading Application Lifecycle Service](/als/v1/admin/server/upgrade/)
    -   [Before an upgrade](/als/v1/admin/server/upgrade/#before-an-upgrade)
        -   [Maintenance Mode](/als/v1/admin/server/upgrade/#maintenance-mode)
        -   [Proxy settings](/als/v1/admin/server/upgrade/#proxy-settings)
        -   [RSA keys](/als/v1/admin/server/upgrade/#rsa-keys)
    -   [Executing the upgrade](/als/v1/admin/server/upgrade/#executing-the-upgrade)
        -   [Upgrading an individual
            node](/als/v1/admin/server/upgrade/#upgrading-an-individual-node)
        -   [Upgrading a cluster](/als/v1/admin/server/upgrade/#upgrading-a-cluster)
        -   [Node upgrade ordering](/als/v1/admin/server/upgrade/#node-upgrade-ordering)
        -   [Node Upgrade Process](/als/v1/admin/server/upgrade/#node-upgrade-process)

Detailed Configuration[](#detailed-configuration "Permalink to this headline")
-------------------------------------------------------------------------------

To continue configuring the Application Lifecycle Service server, see:

-   [Detailed Configuration](/als/v1/admin/server/configuration/)
    -   [General](/als/v1/admin/server/configuration/#general)
        -   [Changing the
            Password](/als/v1/admin/server/configuration/#changing-the-password)
    -   [Network Setup](/als/v1/admin/server/configuration/#network-setup)
        -   [Changing the
            Hostname](/als/v1/admin/server/configuration/#changing-the-hostname)
        -   [Changing IP
            Addresses](/als/v1/admin/server/configuration/#changing-ip-addresses)
        -   [Setting a Static
            IP](/als/v1/admin/server/configuration/#setting-a-static-ip)
        -   [Modifying
            /etc/hosts](/als/v1/admin/server/configuration/#modifying-etc-hosts)
        -   [DNS](/als/v1/admin/server/configuration/#dns)
        -   [Dynamic DNS](/als/v1/admin/server/configuration/#dynamic-dns)
        -   [Alternate DNS
            Techniques](/als/v1/admin/server/configuration/#alternate-dns-techniques)
        -   [Adding DNS
            Nameservers](/als/v1/admin/server/configuration/#adding-dns-nameservers)
        -   [TCP/UDP Port
            Configuration](/als/v1/admin/server/configuration/#tcp-udp-port-configuration)
        -   [HTTP Proxy](/als/v1/admin/server/configuration/#http-proxy)
        -   [Staging Cache & App HTTP
            Proxy](/als/v1/admin/server/configuration/#staging-cache-app-http-proxy)
    -   [VM Filesystem Setup](/als/v1/admin/server/configuration/#vm-filesystem-setup)
    -   [Application Lifecycle Service Data Services vs. High Availability
        Databases](/als/v1/admin/server/configuration/#helion-data-services-vs-high-availability-databases)
    -   [HTTPS & SSL](/als/v1/admin/server/configuration/#https-ssl)
        -   [Using your own SSL
            certificate](/als/v1/admin/server/configuration/#using-your-own-ssl-certificate)
        -   [Adding Custom SSL Certs]
            (/als/v1/admin/server/configuration/#adding-custom-ssl-certs-sni)
        -   [CA Certificate
            Chaining](/als/v1/admin/server/configuration/#ca-certificate-chaining)
        -   [Generating a self-signed SSL
            certificate](/als/v1/admin/server/configuration/#generating-a-self-signed-ssl-certificate)
    -   [Quota Definitions](/als/v1/admin/server/configuration/#quota-definitions)
        -   [sudo](/als/v1/admin/server/configuration/#sudo)
        -   [Allowed
            Repositories](/als/v1/admin/server/configuration/#allowed-repositories)

### [Table Of Contents](/als/v1/index-2/)

-   [Server Configuration](#)
    -   [Accessing Server via the Command
        Line](#accessing-server-via-the-command-line)
    -   [Common Operations](#common-operations)
    -   [Detailed Configuration](#detailed-configuration)


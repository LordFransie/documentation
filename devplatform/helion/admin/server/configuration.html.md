---
layout: default-devplatform
permalink: /als/v1/admin/server/configuration/
---
<!--PUBLISHED-->

Detailed Configuration[](#detailed-configuration "Permalink to this headline")
===============================================================================

   [Changing the Password](#changing-the-password)

-   [Network Setup](#network-setup)
	-   [Changing the Hostname](#changing-the-hostname)
	-   [Changing IP Addresses](#changing-ip-addresses)
	-   [Setting a Static IP](#setting-a-static-ip)
	-   [Modifying the hosts file](#modifying-etc-hosts)
	-   [DNS](#dns)
	-   [Dynamic DNS](#dynamic-dns)
	-   [Alternate DNS Techniques](#alternate-dns-techniques)
		-   [xip.io](#xip-io)
		-   [dnsmasq](#dnsmasq)
		-   [Adding DNS Nameservers](#adding-dns-nameservers)
		-   [TCP/UDP Port Configuration](#tcp-udp-port-configuration)
		-   [HTTP Proxy](#http-proxy)
		-   [Staging Cache & App HTTP Proxy](#staging)
	-   [VM Filesystem Setup](#vm-filesystem-setup)
	-   [Application Lifecycle Service Data Services vs. High Availability Databases](#helion-data-services-vs-high-availability-databases)
	-   [HTTPS & SSL](#https-ssl)
		-   [Using your own SSL certificate](#using-your-own-ssl-certificate)
		-   [Adding Custom SSL Certs (SNI)](#adding-custom-ssl-certs-sni)
		-   [CA Certificate Chaining](#ca-certificate-chaining)
		-   [Generating a self-signed SSL certificate](#generating-a-self-signed-ssl-certificate)
	-   [Quota Definitions](#quota-definitions)
		-   [sudo](#sudo)
		-   [Allowed Repositories](#allowed-repositories)

General[](#general "Permalink to this headline")
-------------------------------------------------

**Note**

After booting the VM, run `kato process ready all`
before starting the following configuration steps. This command returns
`READY` when all configured system processes have
started, and is particularly important when using `kato` commands in automated configuration scripts which run
immediately after boot (the
[*--block*](/als/v1/admin/reference/kato-ref/#kato-command-ref-process-ready)
option is useful in this scenario).

### Changing the Password[](#changing-the-password "Permalink to this headline")

The default password for the `helion` system user
is **helion**.  In clusters created by Helion Orchestration tools (the Horizon Management Console and Installer CLI VM), access after cluster setup is only available by SSH key pair.

This password is changed to match the one set for the first
administrative user created in the Management Console. Once you've set
up the primary Application Lifecycle Service admin account, use that account's password when
logging in to the VM at the command line.

In an Application Lifecycle Service cluster, this change only happens on the node serving the
Management Console pages (which could be one of [*multiple Controller
nodes*](/als/v1/admin/cluster/#cluster-multi-controllers)). In this case,
it's best to log in to each node in the cluster to change the password
manually with the `passwd` command.

Network Setup[](#network-setup "Permalink to this headline")
-------------------------------------------------------------

### Changing the Hostname[](#changing-the-hostname "Permalink to this headline")

You may want or need to change the hostname of the Application Lifecycle Service system,
either to match a DNS record you've created or just to make the system
URLs more convenient. This can be done using the [*kato node
rename*](/als/v1/admin/reference/kato-ref/#kato-command-ref) command:

    $ kato node rename mynewname.example.com

This command will change the system hostname in
`/etc/hostname` and `/etc/hosts`, as well as performing some internal configuration for
Application Lifecycle Service such as generating a new server certificate for the
[*Management
Console*](/als/v1/user/console/#management-console).

mDNS is only supported with ".local" hostnames. If you want to give the
VM a canonical hostname on an existing network, [*configure
DNS*](#server-config-dns) and disable the 'mdns' role:

    $ kato role remove mdns

**Note**

Application Lifecycle Service takes a while to configure itself at boot (longer at first
boot). Check `kato status` to see that core services are running before
executing `kato node rename`.

In a [*cluster*](/als/v1/user/reference/glossary/#term-cluster), you
may also need to manually [*modify the /etc/hosts
file*](#server-config-etc-hosts).

### Changing IP Addresses[](#changing-ip-addresses "Permalink to this headline")

The Application Lifecycle Service *micro cloud* server is initially set up for
[*DHCP*](/als/v1/user/reference/glossary/#term-dhcp) and [*multicast
DNS*](/als/v1/user/reference/glossary/#term-multicast-dns). This is
often sufficient for local testing, but in this configuration is only a
single node and can only be privately routed.

As you move toward production use of the server, further configuration
of IP addresses and hostnames will therefore be required. A production
Application Lifecycle Service server will most likely be a
[*cluster*](/als/v1/user/reference/glossary/#term-cluster) consisting
of several nodes, some of them requiring IP addresses and corresponding
hostnames.

If your server is to be exposed to the Internet, these addresses must be
routable and the hostnames must appear in the global DNS. Even if your
server is to be part of a [*private
PaaS*](/als/v1/user/reference/glossary/#term-private-paas) for
organizational use only, it must still integrate fully with your network
services, DHCP and DNS in particular. Finally, in the rare case that
such services are not available, the Application Lifecycle Service server can be configured
with static IP addresses and hostnames.

Before we examine these scenarios in detail, let's review the separation
of roles in a [*cluster*](/als/v1/admin/cluster/#cluster-setup):

-   The **core** node which we conventionally call
    `api.helion-xxxx.local` in a micro cloud will
    be given its own hostname and IP address in a cluster so that you
    can reach it from both the [*Management
    Console*](/als/v1/user/console/#management-console) and the
    command line.
-   At the same time, the other nodes in the cluster will also need to
    reach the core node, so whatever address is configured on its
    network interface will have to be known to the network, the primary
    node, and all the other nodes. This can be the same as the primary
    address assigned to the core, or a secondary address used purely
    within the cluster.
-   The **router** nodes, if separate from the primary, will each
    require IP addresses of their own, reachable from any load balancer
    and through any firewall that you put in front of them.

Where you configure these hostnames and IP addresses will depend on how
you operate your data center network. You will want to confer with your
network administrator about this, starting with the MAC address
configured for each VM in the hypervisor. If your site supports a
significant number of VMs, DHCP may be set up to map MAC addresses to IP
addresses in a particular way. For example, a certain range of MAC
addresses may be used for servers in the DMZ, and another range for
internal servers. If you follow this convention, your Application Lifecycle Service server
will obtain an appropriate IP address automatically. DNS at your site
may establish a similar convention, which you will want to follow when
making any name or address changes within the cluster.

Having determined the hostnames of cluster nodes to be managed by
[*DNS*](#server-config-dns), the hostname on the primary node should be
set using [*kato node rename*](#server-config-hostname).

Finally, if you must set a static IP on any cluster node, be sure to
test it before making the change permanent, otherwise you may not be
able to reach the node once it reboots. Assuming that the primary
address is on interface `eth0`, a secondary address
`10.0.0.1/24` could be set up temporarily as
follows:

    $ ipcalc -nb 10.0.0.1/24
    Address:   10.0.0.1
    Netmask:   255.255.255.0 = 24
    Wildcard:  0.0.0.255
    =>
    Network:   10.0.0.0/24
    HostMin:   10.0.0.1
    HostMax:   10.0.0.254
    Broadcast: 10.0.0.255
    Hosts/Net: 254                   Class A, Private Internet
    $ sudo ifconfig eth0:1 10.0.0.1 netmask 255.255.255.0 broadcast 10.0.0.255 up

Configure another cluster node using a different address on the same
subnet, and be sure that `ping` works correctly on
the new addresses. You should also use this opportunity to ping the
router and DNS server for this subnet. Check with your network
administrator for their addresses.

### Setting a Static IP[](#setting-a-static-ip "Permalink to this headline")

The easiest way to configure an Application Lifecycle Service VM with a static IP address is
to use the [*kato op
static\_ip*](/als/v1/admin/reference/kato-ref/#kato-command-ref-op) command.

This command will prompt for the following inputs:

-   static IP address (e.g. 10.0.0.1)
-   netmask (e.g. 255.255.255.0)
-   network gateway (e.g. 10.0.0.254)
-   (optional) comma-separated list of DNS names servers (e.g.
    10.0.0.252, 10.0.0.253)
-   (optional) comma-separated list of DNS search domains (e.g.
    example.com, example.org)

kato will verify the IP addresses given are within legal ranges,
automatically calculate the network / broadcast addresses for you, and
prompt for the 'sudo' password to write the changes.

As a precaution, the command does not automatically restart networking
services. To do so, run the following commands:

    $ sudo /etc/init.d/networking restart

You will see a deprecation warning about the `restart` option, which can safely be ignored in this context.

**Note**

If you are setting a new static IP *after* having configured the VM as a
Core node in a cluster, you must run the [*kato node
migrate*](/als/v1/admin/reference/kato-ref/#kato-command-ref-node-attach)
command on each Application Lifecycle Service node to reset the MBUS\_IP for the cluster.

Alternatively, these changes could be made by editing the
*/etc/network/interfaces* file manually. For example:

    auto eth0
    iface eth0 inet static
        address 10.0.0.1
        netmask 255.255.255.0
        network 10.0.0.0
        broadcast 10.0.0.255
        gateway 10.0.0.254
        dns-nameservers 10.0.0.252, 10.0.0.253
        dns-search example.com, example.org

When DHCP is not used, DNS server IP addresses must be set explicitly
using the `dns-nameservers` directive as shown
above. Multiple DNS servers can be specified in a comma separated list.

**Note** that `dnsmasq` does not necessarily
reinitialize on `SIGHUP`. Therefore, perform the
following to reinitialize:

    $ sudo /etc/init.d/dnsmasq restart
    $ sudo /etc/init.d/networking restart

Or use `sudo shutdown -r` to exercise a complete
restart. Then use `ifconfig` to check that the
interface has been configured, and `ping` to check
routing to other hosts on the subnet and out in the world. Finally, use
`dig @<DNS SERVER IP> <HOSTNAME>` to check that DNS
is resolving correctly.

In the event of troubleshooting, you can confirm which DNS servers are
being used by dnsmasq by checking the file
*/var/run/dnsmasq/resolv.conf*.

**Note**

There may be a performance advantage in locally defining a private
secondary IP address ([**RFC
1918**](http://tools.ietf.org/html/rfc1918)) for the controller so
that the other nodes can be assured of routing directly to it. See your
network administrator for advice on which addresses and subnets are
permissible. Once you have this secondary address set up, see the
[*/etc/hosts*](#server-config-etc-hosts) section for final configuration
of the server.

### Modifying /etc/hosts {#modifying-etc-hosts}

The `/etc/hosts` file is used to resolve certain
essential or local hostnames without calling upon the DNS. Unless you
need to [*change the local hostname*](#server-config-hostname), you will
in general *not* have to edit `/etc/hosts` manually,
but when troubleshooting network issues it never hurts to verify that
the file is configured correctly.

As well, various components in a
[*Cluster*](/als/v1/admin/cluster/#cluster-setup) rely on finding the
cluster nodes in `/etc/hosts`: the Cloud Controller
and the RabbitMQ service in particular.

Application Lifecycle Service will automatically configure `/etc/hosts`
on the virtual machine with one entry for the `localhost` loopback address and another for the [**RFC
1918**](http://tools.ietf.org/html/rfc1918) private IP address of
the cluster's Primary node, for example "10.0.0.1" or "192.168.0.1". All
communication between cluster nodes should be strictly through their
private IP addresses and not on routable addresses provided by the DNS.

Remember that `/etc/hosts` does not support
wildcards. You must use some form of [*DNS*](#server-config-dns) for
that.

Consider an Application Lifecycle Service instance called `helion-test`
in domain `example.com`. The following example is
what you should expect to see on a [*micro
cloud*](/als/v1/user/reference/glossary/#term-micro-cloud)
installation, where all roles are running on the same node:

    $ hostname
    helion-test
    $ ifconfig eth0
    eth0      Link encap:Ethernet  HWaddr 08:00:27:fc:1c:f6
      inet addr:10.0.0.1  Bcast:10.0.0.255  Mask:255.255.255.0
      inet6 addr: fe80::a00:27ff:fefc:1cf6/64 Scope:Link
      UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
      RX packets:875142 errors:0 dropped:0 overruns:0 frame:0
      TX packets:106777 errors:0 dropped:0 overruns:0 carrier:0
      collisions:0 txqueuelen:1000
      RX bytes:191340039 (191.3 MB)  TX bytes:23737389 (23.7 MB)
    $ cat /etc/hosts
    127.0.0.1       localhost helion-test
    10.0.0.1        helion-test.example.com api.helion-test.example.com

On a [*cluster*](/als/v1/user/reference/glossary/#term-cluster)
installation, the IP address in /etc/hosts will identify the node
hosting the MBUS, usually the same as the Cloud Controller. On this
node, you will see a correspondence between the network interface
`eth0` address and `/etc/hosts`
as in the above example. On each of the *other nodes* in the cluster,
for example DEA nodes, `eth0` will be configured
with its own address on the same subnet, but `/etc/hosts` will remain the same..

If modifying `/etc/hosts` becomes necessary because
of a hostname change, you can simply edit it as in the following
example:

    $ sudo vi /etc/hosts

### DNS[](#dns "Permalink to this headline")

The Application Lifecycle Service micro cloud uses [*multicast
DNS*](/als/v1/user/reference/glossary/#term-multicast-dns). to
broadcast its generated hostname (e.g. `helion-xxxx.local`). This mechanism is intended for VMs running on a local
machine or subnet.

For production use, the server will need:

-   a public DNS record,
-   a wildcard CNAME record, and
-   a fixed IP address.

For example, a DNS zone file for "helion.example.com" might contain:

    helion.example.com        IN    A        10.3.30.200
    *.helion.example.com      IN    CNAME    helion.example.com

The wildcard CNAME record enables routing for the hostnames created for
each application pushed to Application Lifecycle Service. If your networking policy forbids
the use of wildcard records, you will need to add DNS records for each
application pushed to Application Lifecycle Service as well as the following two hostnames:

-   **api.** - API endpoint for clients and the URL of the Management
    Console (e.g. api.helion.example.com)
-   **aok.** - AOK authentication endpoint (e.g.
    aok.helion.example.com)

If you intend to expose your applications at URLs on other domains (e.g.
using [*helion
map*](/als/v1/user/reference/client-ref/#command-map)) add these names
to the DNS zone file as well. For example:

    app.domain.com              IN    CNAME    helion.example.com

Firewalls and load balancers may require corresponding adjustments.

**Note**

If your site uses DHCP, configure a static binding to the MAC address of
the Application Lifecycle Service VM (and be careful not to change the MAC address
accidentally through the hypervisor). If Application Lifecycle Service is hosted on a cloud
provider, assign a fixed IP address using the platform's tools (e.g.
Floating IP on OpenStack).

With DNS records in place, the multicast DNS broadcast is no longer
necessary. To turn it off on the Application Lifecycle Service server, use the command:

    $ kato role remove mdns

### Dynamic DNS[](#dynamic-dns "Permalink to this headline")

If you don't have access to a DNS server, you can use a dynamic DNS
provider, such as [ChangeIP](http://www.changeip.com/freedomains.asp)
and
[others](https://help.ubuntu.com/community/DynamicDNS#Registering_with_a_Dynamic_DNS_provider),
to provide DNS records. You will need one that provides wildcard
subdomain assignment.

Before registering your domain, be sure that your mail server will
accept email from the provider (for example
`support@changeip.com`).

Create an account, choose a subdomain, and ensure that a wildcard
assignment is made on the subdomain to handle `api`
and related application subdomains. Then wait to receive the
authorization email, and verify the zone transfer before proceeding.

### Alternate DNS Techniques[](#alternate-dns-techniques "Permalink to this headline")

For situations where mDNS will not work (e.g. running in a cloud hosting
environment or connecting from a Windows system without mDNS support)
but which do not merit the effort of manually configuring a DNS record
(e.g. a test server) alternative methods are available.

#### xip.io [](#xip-io "Permalink to this headline")

The quickest way to get wildcard DNS resolution is to use the
[xip.io](http://xip.io/) service.  This is the approach taken on clusters created with the Horizon Management Console panel or Application Lifecycle Service Installer CLI, and is done as part of the setup process.

[*Change your hostname*](#server-config-hostname) using [*kato node
rename*](/als/v1/admin/reference/kato-ref/#kato-command-ref-node-attach) to
match the external IP address with the 'xip.io' domain appended. For
example:

    $ kato node rename 10.9.8.7.xip.io

This will change the system hostname and reconfigure some internal
Application Lifecycle Service settings. The xip.io DNS servers will resolve the domain
'10.9.8.7.xip.io' and all sub-domains to '10.9.8.7'. This works for
private subnets as well as public IP addresses.

#### dnsmasq[](#dnsmasq "Permalink to this headline")

Locally, you can run
[*dnsmasq*](/als/v1/user/reference/glossary/#term-dnsmasq) as a simple
DNS proxy which resolves wildcards for
`*.helion-test.example.com` to
`10.9.8.7` when line such as the following is
present in any of its configuration files:

    address = /.helion-test.example.com/ 10.9.8.7

You must restart the service to pick up the changed configuration:

    $ /etc/init.d/dnsmasq restart

### Adding DNS Nameservers[](#adding-dns-nameservers "Permalink to this headline")

You may need to add site-specific DNS nameservers manually if the
Application Lifecycle Service VM or applications running in Application Lifecycle Service containers need to
resolve internal hosts using a particular nameserver.

To explicitly add a DNS nameserver to an Application Lifecycle Service VM running under DHCP,
edit */etc/dhcp/dhclient.conf* and add a line with the DNS server IP.
For example:

    append domain-name-servers 10.8.8.8;

Reboot to apply the changes.

For Application Lifecycle Service VMs with a static IP, add the nameservers when prompted
when running the `kato op static_ip` command (see
[*Setting a Static IP*](#server-config-static-ip) above).

### TCP/UDP Port Configuration[](#tcp-udp-port-configuration "Permalink to this headline")

The Application Lifecycle Service [*micro
cloud*](/als/v1/user/reference/glossary/#term-micro-cloud) runs with
the following ports exposed:

<table>
<tr><td>Port</td><td>Type</td><td>Service</td></tr>
<tr><td>22</td><td>tcp</td><td>ssh</td></tr>
<tr><td>25</td><td>tcp</td><td>smtp</td></tr>
<tr><td>80</td><td>tcp</td><td>http</td></tr>
</table>

On a production cluster, or a micro cloud running on a cloud hosting
provider, only ports 22 (SSH), 80 (HTTPS) and 443 (HTTPS) need to be
exposed externally (e.g. for the Router / Core node).

Within the cluster (i.e. behind the firewall), it is advisable to allow
communication between the cluster nodes on all ports. This can be done
safely by using the security group / security policy tools provided by
your hypervisor.

If you wish to restrict ports between some nodes (e.g. if you do not
have the option to use security groups), the following summary describes
which ports are used by which components. **Source** nodes initiate the
communication, **Destination** nodes need to listen on the specified
port.

<table>
<tr><td>Port Range</td><td>Type</td><td>Source</td><td>Destination</td><td>Required By</td></tr>
<tr><td>22</td><td>tcp</td><td>all nodes</td><td>all nodes</td><td>ssh/scp/sshfs</td></tr>
<tr><td>4222</td><td>tcp</td><td>all nodes</td><td>all nodes</td><td>dea,controller</td></tr>
<tr><td>3306</td><td>tcp</td><td>dea,controller</td><td>mysql nodes</td><td>MySQL</td></tr>
<tr><td>5432</td><td>tcp</td><td>all nodes</td><td>postgresql nodes</td><td>PostgreSQL</td></tr>
<tr><td>5454</td><td>tcp</td><td>all nodes</td><td>controller</td><td>redis</td></tr>
</table>
   
More on  [*NATS*](/als/v1/user/reference/glossary/#term-nats) communication
    with the MBUS IP (core Cloud Controller)10 is available in the glossary.

Each node can be internally firewalled using
[iptables](http://manpages.ubuntu.com/manpages/man8/iptables.8) to
apply the above rules.

Comments:

-   Ports 80 and 443 need only be open to the world on router nodes.
-   Port 4222 should be open on all nodes for
    [*NATS*](/als/v1/user/reference/glossary/#term-nats) communication
    with the MBUS IP (core Cloud Controller)
-   Port 9022 should be open to allow transfer of droplets to and from
    the DEAs, and Cloud Controllers.
-   Port 7845 is required if you plan to stream logs from all nodes in a
    cluster using `kato log tail` command.
-   External access on port 22 can be restricted if necessary to the
    subnet you expect to connect from. If you are providing the
    `helion ssh` feature to your users
    (recommended), define a distinct security group for the
    public-facing Cloud Controller node that is the same as a generic
    Application Lifecycle Service group, but has the additional policy of allowing SSH (Port
    22) from hosts external to the cluster.
-   Within the cluster, port 22 should be open on all hosts to allow
    administrative access over SSH. Port 22 is also used to mount
    Filesystem service partitions in application containers on the DEA
    nodes (via SSHFS).
-   The optional Harbor port service has a configurable port range
    (default 41000 - 61000) which can be exposed externally if required.

### HTTP Proxy[](#http-proxy "Permalink to this headline")

**Note**

If your network has an HTTP proxy, the helion client may attempt to
use this when connecting to api.helion-xxxx.local and fail because the
changes in `/etc/hosts` file are not reflected in
the proxy. To work around this problem in Windows, enable
`\*.local` in the `ProxyOverride` registry key
`HCU/Software/Microsoft/Windows/CurrentVersion/Internet Settings`.

In some cases, it may be a requirement that any HTTP request is first
handled through an upstream or parent proxy (HTTP requests may not be
directly routable otherwise).

In this case it is necessary to tell
[*Polipo*](/als/v1/user/reference/glossary/#term-polipo) about the
proxy so it knows how to handle this correctly.

Open the Polipo config file `/etc/polipo/config` and
add the lines:

    parentProxy = <IP>:<PORT>
    parentAuthCredentials = "myuser:mypassw"

Then restart Polipo:

    $ sudo /etc/init.d/polipo restart

If you are using a SOCKS proxy, edit the file in the same way but with
the lines:

    socksParentProxy=<IP>:<PORT>
    socksProxyType=socks4a | OR | socks5;

Then restart Polipo:

    $ sudo /etc/init.d/polipo restart

For log info, any errors reported by Polipo are available on the
Application Lifecycle Service server in `/var/log/polipo/polipo.log`.

###Staging Cache & App HTTP Proxy {#staging}

Application Lifecycle Service caches all application dependencies that are downloaded by
module managers that support the
[*HTTP\_PROXY*](/als/v1/user/reference/environment/#term-http-proxy)
environment variable (e.g. pip, PyPM, PPM, NPM, etc). This is limited to
100MB of in-memory cache.

If you have an upstream HTTP proxy that deployed applications and the
staging system need to traverse to access the internet, use the
`kato op upstream_proxy ...` command on all DEA
nodes:

    $ kato op upstream_proxy set 192.168.0.99:3128

To remove the proxy setting:

    $ kato op upstream_proxy delete <proxy_addr>

To set an HTTP proxy exclusively for apps, add an
`environment/app_http_proxy` setting in the dea\_ng
config using [*kato config
set*](/als/v1/admin/reference/kato-ref/#kato-command-ref-config). For example:

    $ kato config set dea_ng environment/app_http_proxy 10.0.0.47:3000

Adding this configuration sets the 'http\_proxy' environment variable
within all subsequently created application containers.

VM Filesystem Setup[](#vm-filesystem-setup "Permalink to this headline")
-------------------------------------------------------------------------

The Application Lifecycle Service VM is distributed with a simple default partitioning scheme
(i.e. everything but "/boot" mounted on "/").

Warning

When setting up a production cluster, additional filesystem
configuration is necessary to prevent certain nodes from running out of
disk space.

Some nodes in a production cluster may require additional mount points
on external block storage for:

-   services (data and filesystem service nodes)
-   droplets (controller nodes)
-   containers (DEA and Stager nodes)

Suggestions for mounting block storage and instructions for relocating
data can be found in the [*Persistent
Storage*](/als/v1/admin/best-practices/#bestpractices-persistent-storage)
section.

Application Lifecycle Service Data Services vs. High Availability Databases[](#helion-data-services-vs-high-availability-databases "Permalink to this headline")
----------------------------------------------------------------------------------------------------------------------------------------------

Application Lifecycle Service data services do not offer any built-in redundancy. For
business-critical data storage, a high-availability database or cluster
is recommended.

To use an external database instead of the data services provided by
Application Lifecycle Service, specify the database credentials directly in your application
code instead of using the credentials from the
[*VCAP\_SERVICES*](/als/v1/user/reference/environment/#term-vcap-services)
environment variable.

To tie external databases to Application Lifecycle Service as a data service, see the
examples in the [*Adding System
Services*](/als/v1/admin/reference/add-service/#add-service) section.

HTTPS & SSL[](#https-ssl "Permalink to this headline")
-------------------------------------------------------

HTTPS mode provides access to the provisioned apps using wild card SSL
certificates through the router or
[*Nginx*](/als/v1/user/reference/glossary/#term-nginx) web server.

There are self-signed certificates on the VM to match the default
hostname `helion-xxxx.local`. These certificates
can be found in:

-   `/etc/ssl/certs/helion.crt` (Public
    Certificate)
-   `/etc/ssl/private/helion.key` (Used to
    generate the signed certificates)

If you change the hostname, you will need to regenerate the certificates
or use your own (signed or self-signed) certificate.

### Using your own SSL certificate[](#using-your-own-ssl-certificate "Permalink to this headline")

On all router nodes, upload your *.key* file to the */etc/ssl/private/*
directory and your *.crt* file to */etc/ssl/certs/*. Change the
following settings in */s/code/helion-router/config/local.json* to
point to the new files:

    "sslKeyFile": "/etc/ssl/private/example.key",
    "sslCertFile": "/etc/ssl/certs/example.crt",

### Adding Custom SSL Certs (SNI)[](#adding-custom-ssl-certs-sni "Permalink to this headline")

The Application Lifecycle Service router supports
[SNI](http://en.wikipedia.org/wiki/Server_Name_Indication), and custom
SSL certificates for domains resolving to the system can be added using
the [*kato op custom\_ssl\_cert
install*](/als/v1/admin/reference/kato-ref/#kato-command-ref-op) command.
Usage:

    kato op custom_ssl_cert install <key-path> <cert-path> <domain> [--wildcard-subdomains]

This must be run on all router nodes in a cluster: the first one as
above, subsequent routers using the `--update` flag.

**Note**

SNI support with multiple Application Lifecycle Service routers works only with TCP load
balancers (e.g. HAProxy, iptables, F5) not HTTP load balancers (e.g.
Nginx, Application Lifecycle Service load balancer).

### CA Certificate Chaining[](#ca-certificate-chaining "Permalink to this headline")

When using a signed certificate for Application Lifecycle Service, the certificates in the
chain must be concatenated in a specific order:

-   the domain's crt file
-   intermediate certs
-   the root cert

For example, to create the final certificate for the chain in Nginx
format:

    $ sudo su -c "cat /etc/ssl/certs/site.crt /path/to/intermediate.crt /path/to/rootCA.crt > /etc/ssl/certs/helion.crt"

Once the cert is chained, restart the router processes:

    $ kato restart router

Verify that the full chain is being sent by Nginx using
`openssl`. You should see more than one number in
the list. For example:

    $ openssl s_client -connect api.stacka.to:443
    ---
    Certificate chain
     0 s:/C=CA/ST=British Columbia/L=Vancouver/O=HP Software Inc./OU=Application Lifecycle Service/CN=*.stacka.to
       i:/C=US/O=DigiCert Inc/OU=www.digicert.com/CN=DigiCert High Assurance CA-3
     1 s:/C=US/O=DigiCert Inc/OU=www.digicert.com/CN=DigiCert High Assurance CA-3
       i:/C=US/O=DigiCert Inc/OU=www.digicert.com/CN=DigiCert High Assurance EV Root CA
     2 s:/C=US/O=DigiCert Inc/OU=www.digicert.com/CN=DigiCert High Assurance EV Root CA
       i:/C=US/O=Entrust.net/OU=www.entrust.net/CPS incorp. by ref. (limits liab.)/OU=(c) 1999 Entrust.net Limited/CN=Entrust.net Secure Server Certification Authority

### Generating a self-signed SSL certificate[](#generating-a-self-signed-ssl-certificate "Permalink to this headline")

You can re-generate Application Lifecycle Service's self-signed SSL certificate by running
the following command on the VM:

    $ kato op regenerate ssl_cert

To do essentially the same operation manually (substituting
"hostname.mydomain.com" with your own details):

    $ mkdir ~/hostname.mydomain.com
    $ cd ~/hostname.mydomain.com
    $ (umask 077 && touch host.key host.cert host.info)
    $ openssl genrsa 2048 > host.key
    $ openssl req -new -x509 -nodes -sha1 -days 365 -key host.key -multivalue-rdn \
            -subj "/C=CA/emailAddress=email@mydomain.com/O=company_name/CN=*.mydomain.com/CN=mydomain.com" \
            >host.crt

For specific configurations that can be used in the `-subj` option, see <http://www.openssl.org/docs/apps/req.html>.

Following that, run:

    $ openssl x509 -noout -fingerprint -text < host.crt > host.info
    $ chmod 400 host.key host.crt

To get the router to use the new certificate and key files, follow the
steps in the [*Using your own SSL
certificate*](#server-config-ssl-cert-own-use) section above.

With any self-signed SSL certificate, you will get browser warning
messages. The certificate will need to be added to the browser exception
rules, which you will be prompted to do so when visiting one of your
apps via HTTPS for the first time.

Quota Definitions[](#quota-definitions "Permalink to this headline")
---------------------------------------------------------------------

Quota definitions define limits for:

-   physical memory (RAM) in MB
-   number of services
-   `sudo` privilege within application containers

Each organization is assigned a quota definition, and all users of an
organization share the defined limits.

Use the `helion quota ...` commands to modify
quota definitions:

-   [*helion quota
    configure*](/als/v1/user/reference/client-ref/#command-quota-configure)
-   [*helion quota
    create*](/als/v1/user/reference/client-ref/#command-quota-create)
-   [*helion quota
    delete*](/als/v1/user/reference/client-ref/#command-quota-delete)
-   [*helion quota
    list*](/als/v1/user/reference/client-ref/#command-quota-list)

Existing quota definitions can also be viewed and edited in the
Management Console [*Quota Definitions
settings*](/als/v1/admin/console/customize/#console-settings-quota-definitions)

### sudo[](#sudo "Permalink to this headline")

Quota Definitions can give all users in an Organization the use of the
`sudo` command within application containers. This
option is disabled by default as a security precaution, and should only
be enabled for Organizations where all users are trusted.

### Allowed Repositories[](#allowed-repositories "Permalink to this headline")

Even if `sudo` is restricted, special access can be
given to specific repositories for modules and resources needed during
the staging process.

To configure these, modify the `allowed_repos:`
parameter of the `cloud_controller.yml` file:

        allowed_repos:
    - "deb mirror://mirrors.ubuntu.com/mirrors.txt natty main restricted universe multiverse"
    - "deb mirror://mirrors.ubuntu.com/mirrors.txt natty-updates main restricted universe multiverse"
    - "deb http://security.ubuntu.com/ubuntu natty-security main universe"

The file is located on the Application Lifecycle Service server at
`~/helion/vcap/cloud_controller/config/cloud_controller.yml`
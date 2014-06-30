---
layout: default-devplatform
permalink: /als/v1/admin/reference/architecture/
---

Architectural Design[](#architectural-design "Permalink to this headline")
===========================================================================

 <img src="/content/devplatform/stackato/images/helion-architecture-diagram.png" />

The Application Lifecycle Service VM is a stand-alone [*micro
cloud*](/als/v1/user/reference/glossary/#term-micro-cloud) virtual
machine with all the components necessary for running a test environment
in one instance. For use on a larger scale, the VM can be cloned and
assigned specific roles: Router, Cloud Controller, Droplet Execution
Agents (DEAs, or worker nodes), or specific database services.

Roles[](#roles "Permalink to this headline")
---------------------------------------------

### Base[](#base "Permalink to this headline")

The Base role comprises of several processes that are necessary for any
node to function as part of an Application Lifecycle Service cluster, and is mostly
responsible for communicating with the primary node and forwarding log
information.

This role cannot be disabled on any node.

### Primary[](#primary "Permalink to this headline")

The Primary role is a mandatory part of a Core node (or micro cloud) and
runs a number of critical system processes, including the Health
Manager.

The Health Manager keeps track of the apps on each DEA and provides
feedback on the number currently running. It works in conjunction with
the Cloud Controller and must be run on the same VM.

In a cluster setup, all nodes performing other roles are attached to the
MBUS IP of the Core node. Every cluster must include exactly one Primary
role.

### Cloud Controller[](#cloud-controller "Permalink to this headline")

The Controller manages most of the operations of an Application Lifecycle Service system. It
hosts the Management Console, provides the API endpoint for client
access, manages the cloud\_controller\_ng process, provisions services,
dispatches applications for staging and deployment, and (with the Health
Manager) tracks the availability of DEA nodes.

In a cluster setup, the Controller role must run on the [*Core
node*](/als/v1/admin/cluster/#server-cluster-core-node) that all other
VM's in the cluster connect to.

A single Controller is sufficient for small and mid-sized clusters, but
[*multiple
Controllers*](/als/v1/admin/cluster/#cluster-multi-controllers) can be
configured if neccessary for larger implementations.

### Router[](#router "Permalink to this headline")

The router directs incoming network traffic to the appropriate
application.

For smaller configurations, the router can be run on the same Application Lifecycle Service
VM as the other components.

When additional DEAs are in use and traffic increases, additional
routers can be added to handle the load. This will require a [*load
balancer*](/als/v1/admin/cluster/#cluster-load-balancer) to be available
in the cluster.

### Droplet Execution Agents[](#droplet-execution-agents "Permalink to this headline")

The Droplet Execution Agent (DEA) role in Application Lifecycle Service is responsible for
staging applications and running application instances within Linux
containers. In an Application Lifecycle Service cluster, there will typically be a number of
nodes running the DEA role, which in turn each host multiple user
application instances.

The DEA role is comprised of a number of processes:

> -   dea\_ng: Master process for staging and starting application
>     instances, reporting on their state via NATS to the Health
>     Manager.
> -   dir\_server: Handles requests for directories/files, responding
>     with an HTTP URL.
> -   fence: Responsible for the management of application containers
>     using Docker.
> -   apptail: Streams application logs via Logyard to various log
>     drains.

In previous versions of Application Lifecycle Service, staging and running were handled by
separate components (Stager and DEA respectively), but these roles have
been combined in version 3.0 and later.

The Docker image used for the containers can be customized by admins.

Service Roles[](#service-roles "Permalink to this headline")
-------------------------------------------------------------

Application Lifecycle Service nodes can also be assigned roles for data services. The data
services can be run separately on their own nodes, or grouped together.

### Databases:[](#databases "Permalink to this headline")

-   mysql
-   postgresql
-   redis
-   mongodb

### Other data services:[](#other-data-services "Permalink to this headline")

-   filesystem ( Persistent filesystem service )
-   rabbit ( RabbitMQ message queue service )
-   memcached
-   Harbor ( Ports service )

Role Groups[](#role-groups "Permalink to this headline")
---------------------------------------------------------

Role groups represent a set of roles. For example the **data-services**
group provides all databases plus RabbitMQ and the filesystem service:

    $ kato role add data-services

Additional groups can be defined by administrators in
*/s/etc/kato/role\_groups.yml*.

### [Table Of Contents](/als/v1/index-2/)

-   [Architectural Design](#)
    -   [Roles](#roles)
        -   [Base](#base)
        -   [Primary](#primary)
        -   [Cloud Controller](#cloud-controller)
        -   [Router](#router)
        -   [Droplet Execution Agents](#droplet-execution-agents)
    -   [Service Roles](#service-roles)
        -   [Databases:](#databases)
        -   [Other data services:](#other-data-services)
    -   [Role Groups](#role-groups)


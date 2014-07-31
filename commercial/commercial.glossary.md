---
layout: default
title: "HP Helion OpenStack&#174; Glossary"
permalink: /helion/openstack/glossary/
product: commercial

---

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/helion/openstack/related-links/">&#9664; PREV | <a href="/helion/openstack/">&#9650; UP</a> | <a href="/helion/openstack/eula/"> NEXT &#9654; </a></p>

# HP Helion OpenStack&#174; Glossary

Use this glossary to get definitions of terms used throughout the HP Helion OpenStack-documentation.

For more terms, see the [OpenStack glossary](http://docs.openstack.org/glossary/content/glossary.html) also.

[A](#a) | [B](#b) | [C](#c) | [D](#d) | [E](#e) | [F](#f) | [G](#g) | [H](#h) | [I](#i) | [J](#j) | [K](#k) | [L](#l) | [M](#m) | 
[N](#n) | [O](#o) | [P](#p) | [Q](#q) | [R](#r) | [S](#s) | [T](#t) | [U](#u) | [V](#v) | [W](#w) | [X](#x) | [Y](#y) | [Z](#z)


## A

###Abstraction layer### {#AbstractionLayer}
:    A coding layer that provides an intermediary between a programmer and a more complex underlying base code set.  The abstraction layer simplifies the complexities of the 
underlying [REST](#REST) API and JSON/XML formatting of the [request abstraction](#RequestAbstraction) layer code. 

###Access control list (ACL)###
:    A list of permissions attached to an object.

###Allocation###
:    Tee provisioning of cloud resources, such as VM placement in data centers, network virtualization, and network routing.

###API### {#API}
:     An Application Programming Interface (API) is a set of routines, protocols, and tools for building software applications. An API makes it easier to develop a program by providing all the building blocks. A programmer then puts the blocks together. HP Helion OpenStack provides several [REST](#REST) APIs that enable programmers to write applications consistent with the operating environment.

###API key
:     An API-based key used for [authentication](#Auth), such as a [token](#Token).

###Authentication### {#Auth}
:     A service that confirms the identity of a user. The Identity Service confirms that each incoming request is made by the user who claims to be making the call by validating a set of claims that the user is making. These claims are initially in the form of a set of credentials 
(such as, username/password or user access keys). After initial confirmation, the Identity Service issues the user a [token](#AuthToken) that a user can provide when making subsequent requests.

###Authentication Token### {AuthToken}
:     A string that an authenticated user must present for subsequent requests to other services.

## B

<!-- JS: replaced by TripleO install framework:
###Barclamp###
:    Also known as an install module, defines the capability of a service or role to apply to individual hosts or a set of hosts. To deploy a barclamp, a proposal is created.
--> 

###Baremetal Host###
:    The machine that runs the nova-compute and nova-baremetal-deploy-helper services. The baremetal host functions like a [hypervisor](#Hyper) by providing power management and imaging services.

###Baremetal Node### {Baremetal}
:     A baremetal node is a computer in which a virtual machine is installed directly on hardware rather than within the host operating system (OS). The baremetal nodes are controlled by the baremetal host.

###Block storage###
:     Information stored in raw form, with no consideration as to the type of information. See also [Volume Operations](#Volume).

###Bootable Image###
:     *See* [Volume (bootable)](#VolumeBootable).

###Broad network access###
:     A network architecture where cloud capabilities are available over the network and are accessed through standard mechanisms that promote the use by heterogenous thin-client or thick-client platforms.  Examples: mobile phones, tablets, laptops and workstations.


## C

###Ceilometer### {#Ceilometer}
:    See [Telemetry and Reporting](#Reporting)

###Cinder### {#Cinder}
:    See [Volume Operations](#Volume)

###CLI###
:     Command-line interface.

###Cloud computing###
:     A model for enabling ubiquitous, convenient, on-demand network access to a shared pool of configurable computing resources.  These resources include networks, servers, storage, applications and services. 

One advantage of cloud computing is that the resources can be provisioned or released rapidly, with minimal management effort or service provider interaction.

###Cloud Controller###
:    A node that hosts the software that controls an Infrastructure as Service (IaaS) cloud computing platform. A cloud controller contains those services that are considered single services for a cloud environment, such as [Networking](#Networking) and [Imaging](#Image),<!-- not in beta Graffiti, Eve, and Focus, --> and define the boundaries of the cloud environment from an identity standpoint. 
*See also* [Compute Region Controller](#Compute-Region-Controller), [Network Controller](#Network-Controller), and [Storage Controller](#Storage-Controller). 

###Cloud OS Distribution Network (CODN)###
:    A catalog-based HP Helion OpenStack service that allows off-the-shelf content (like workloads, images, and patches) to be imported into your deployed cloud. To access CODN, see the Updates & Extensions panel in the  HP Helion OpenStack user interface. You can import content from the CODN portal or from a local folder.

###Compute### {#Compute} 
:     The HP OpenStack service that manages the hypervisors and virtual machines in your environment. Compute provides a cloud computing fabric controller, the main part of an Infrastructure as a Service (IaaS) platform. Also known as [Nova](#Nova).

###Compute Node###
:     The machine that hosts cloud virtual machine instances using any supported hypervisor with OpenStack. In the current release,  HP Helion OpenStack supports KVM (qemu-kvm) and VMware (ESXi) as hypervisors. The compute node hosts OpenStack services called Nova-compute and Neutron l2 agent. Multiple Compute Nodes can be created to expand cloud capacity.

###Compute Region Controller### {#Compute-Region-Controller}
:    A controller responsible for scheduling a launch of instances across compute nodes. You can have multiple compute regions in your cloud.  A compute region is a pool of compute resources that can be consumed through a service API by consumers of the cloud, such as [Networking service](#Networking). The scheduling is based on varied flavors of instances and available resources on the compute nodes. In a single compute region deployment model, this can coexist with cloud controller services.

###Credentials###
:     Data that belongs to, is owned by, and generally only known by a user, that a user can present to prove their identity. Associated with the [Identity service](#Identity).

## D

###Deprovisioning###
:     Deallocating a cloud resource. See also [Provisioning](#Provisioning).

###Domain Name###
:   An identification string that defines a realm of administrative autonomy, authority, or control on the Internet.

###Domain Name Systyem (DNS)### {#DNS}
:    A service that provides look up of the actual internet address (IP address) of domains. 

###DNS Server### 
:   A server that stores the [DNS records](#DNS) for a domain name, such as address (A or AAAA) records, name server (NS) records, and mail exchanger (MX) records.

## E

###Endpoint### 
:    A network-accessible address, usually described by URL, where a service may be accessed. Associated with the [Identity service](#Identity).


<!-- Not in Commercial beta
###Eve###
:     A HP Helion OpenStack composite provisioning service that uses a topology design and profile to create VMs, volumes, and network segments as described in the topology. Eve uses the Graffiti service to determine the resource pool existence, traits, and user identity mapping. -->

## F

###Flat networking###
:     A network that uses Ethernet adapters configured as bridges to allow the network traffic to transit between the various baremetal nodes. All stations can reach one another without going through an intermediary hardware device, such as a router. and does not require a switch that does VLAN tagging.

A flat network can eb set up with a single adapter on the Baremetal host. 

###Flavor### {#Flavor}
:     The compute, memory, and storage capacity of Baremetal nodes.

###Floating IP address###
:     An on-demand, allocatable public IP address on a network. You can allocate a number of floating IP addresses up to the quota limit, and then assign them to [instances](#Instance).

<!-- Not in Commercial beta
###Focus###
:     The  HP Helion OpenStack Topology Document Repository Service, which is used to discover, register, version, and retrieve the document types needed to describe TOSCA-based infrastructure topologies while provisioning a cloud. See [TOSCA](#TOSCA). -->

###Fully Qualified Domain Name (FQDN)###
:    The complete domain name for a specific computer, or host, on the Internet. The FQDN consists of two parts: the hostname and the domain name. . 


## G

###Glance### {#Glance}
:    *See* [Telemetry and Reporting](#Reporting)

<!-- Not in Commercial beta
###Graffiti###
:     The HP Helion OpenStack Resource Pool Registry and Capability Tagging Service, providing a dictionary of the "capabilities" of all the resources in a cloud environment; a searchable directory to find cloud resources based on their capabilities; the mechanism for dynamic binding, allowing you to describe requirements rather than concrete bindings; and the base concepts of requirements and capabilities within TOSCA. -->

## H

###Heat###
:     See [Orchestration](#Orchestration).

###Horizon###
:    The Horizon service is the basis of the HP Helion OpenStack dashboards. 

###Hybrid cloud###
:     A cloud infrastructure that is a composition of two or more distinct cloud infrastructures (private or public) that remain unique entities, but are bound together by standardized or proprietary technology that enables data and application portability, such as cloud bursting for load balancing between clouds.  

###Hypervisor### {#Hyper}
:     A piece of computer software, firmware, or hardware that creates and runs virtual machines. Each virtual machine appears to have the host's processor, memory, and other resources all to itself.

## I

###Identity Management### {#Identity}
:     The HP OpenStack service that performs identity management (domains, projects and users), generates access tokens, and provides service catalog functionality.

###Image### {#Image}
:    1) An installable release package of a program, application, or software.  

2) A copy of a virtual machine including the operating system information, machine state, and application configurations.
See also [Private image](#ImagePriv) and [Public image](#ImagePub).

###Image file### {#ImageFile}
:    A virtual disk [image](#Image) file that the Compute service can load up to create a virtual machine.

###Image Management ###{#Image}
:     The HP OpenStack service that discovers, registers, and retrieves virtual machine (VM) images. Also known as Glance.

###Image metadata### {#ImageMeta}
:    Metadata information about [images](#Image). For example: metadata includes the image identifier, name, status, size, disk format, container format, owner, and custom properties. Metadata is data that describes other data.

###Installer System### {#Installer}
:    The machine where HP OpenStack Helion installation is initiated. This is the same machine as the [KVM host](#KVMhost) and is called the [seed VM](#Seed-Cloud).  

###Instance### {#Instance}
:    A virtual machine that runs inside the cloud.

###Intelligent Platform Management Interface (IPMI)###
:    A standardized computer interface used by administrators for out-of-band management of computers and monitoring of their operation. IPMI manages a computer that is powered off or otherwise unresponsive by using a network connection to the hardware rather than to an operating system or login shell.

###IPMI Network###
:    The network that connects the baremetal host to the Intelligent Platform Management Interface (IPMI).

###Ironic###
:    The HP OpenStack project to provision [baremetal](#Baremetal) nodes by leveraging common technologies such as PXE boot and [IPMI](#IPMI) to cover a wide range of hardware, while supporting pluggable drivers to allow vendor-specific functionality to be added.


## J


## K

###Kernel-based Virtual Machine (KVM)### {#KVM}
:    A full virtualization solution for Linux that enables multiple virtual machines. See also [KVM Hypervisor](#KVMhyp) and [KVM Host](#KVMhost).

###Key pair###
:     A pair of key values used for verification purposes; generally one key value is private, and the other public (i.e. user-owned).

###Keystone###
:    See [Identity Management](#Identity)

###KVM Hypervisor### {#KVMhyp}
:     The virtualization layer in [Kernel-based Virtual Machine or KVM](#KVM). The KVM hypervisor is a default hypervisor supported by the HP OpenStack [Compute service](#Compute). 

###KVM Host### {#KVMhost}
:    The machine which runs the [Kernel-based Virtual Machine or KVM](#KVM).  This is the same machine as the [Installer System](#Installer).

## L

## M

###Measured service###
:     A service where a cloud provider automatically controls and optimizes resource usage by leveraging a metering capability.  

Resource allocation in a measured service environment include [rapid elasticity](#RapidE) and [resource pooling](#Pooling). 

This metering may occur at some level of abstraction that's appropriate to the type of service, such as storage, processing power, bandwidth, and the number of active users.  Resource usage may be monitored, controlled, and reported.  Measured service provides transparency for the provider and the consumer of the utilized service. 

###Model abstraction###
:     A coding layer that provides a more functional and user-friendly abstraction for the [REST](#Rest) API programming calls. For example, instead of a direct call to GET containers, via the model abstraction layer the programming call for GET container **container-name** is `directories.get("container-name")` . 

:     A model layer can also include particular kinds of objects and expose those object characteristics using simple properties or attributes. For example, *Server* is a model that represents the concept of a virtual [instance](#Instance), with the *Server* model including properties and attributes such as name, [flavor](#Flavor), [image](#Image), addresses, and so on.   See also, [Abstraction layer](#AbstractionLayer).

## N

###Networking### {#Networking}
:     The OpenStack Network Connectivity Service, which is used to create and provision virtual networks. Also known as [Neutron](#Neutron)

###Neutron### {#Neutron}
:     See [Networking](#Networking).

###Node###
:     A computing resource in a network. In other publications, sometimes called a machine.

###Nova### {Nova}
:     See [Compute](#Compute).

## O

###Object Operations### {#Object}
:     The HP OpenStack service to store and retrieve large amounts of data in virtual containers.  

###On-demand self service###
:     A service where a consumer can unilaterally provision computing capabilities, such as server time and network storage, as needed, automatically, without requiring human interaction with each service provider. 

###OpenStack###
:     An open-source cloud computing operating system.

<!-- JS: Not in Core, I think. 
###Operational Dashboard### {#Operational-Dashboard}
:    The HP Helion OpenStack Operational Dashboard is used to install, set up, configure, and stand up a cloud environment See also [Administration Dashboard](#Administration-Dashboard), which is 
used to manage the cloud that you created. 
-->

###Overcloud### {#Overcloud}
:     An image that is deployed onto physical machines by the [Undercloud](#Undercloud). Overcloud images have specialized roles: Management, Object Operations, and Compute. See also [Seed VM](#Seed-Cloud) and 
[Undercloud](#Undercloud).

###Orchestration {#Orchestration}
:     The HP Helion OpenStack service that provides a template-based method for describing a cloud application. A template is a YAML file that describes the infrastructure for a cloud application. Templates contain vendor-independent specifications for launching a particular service or application. Also known as [Heat](#Heat).

## P

###Preboot Execution Environment (PXE) Booting### {#pxe}
:    One of the components of [Intel's Wired for Management](#WFM) specification. PXE allows a machine to boot from a machine on a network prior to booting the operating system on the local hard drive. For more, start on this <a href="http://en.wikipedia.org/wiki/Preboot_Execution_Environment" target="pxe">Wikipedia.org page</a>. 

###Private cloud###
:     A cloud infrastructure that is provisioned for exclusive use by a single organization comprising multiple consumers, such as business units.  The private cloud may be owned, managed and operated by the organization, a third party. or some combination, and it may exist on or off the owner's premises.

###Private image### {#ImagePriv}
:    An [image](#Image) that is limited to all users in a [project](#Project).

###Project### {#Project}
:    A grouping that allows users within each group to view and use the same set of resources. Associated with the [Identity service](#Identity). Also known as Tenant.

###Provisioning### {#Provisioning}
:    The allocation, auditing, and monitoring of cloud resources to users of those resources. 

###Public cloud###
:     A cloud infrastructure that is open use by the general public.  A public cloud may be owned, managed and operated by a business, academic, or government organization, or some combination.  

###Public images### {#ImagePub}
:    An [image](#Image) that is available to all users across all projects in a domain.

###Public network###
:    Used for connecting devices that are external to the cloud infrastructure.

###PXE###

:    *See* [Preboot Execution Environment](#pxe).

## Q

###Quantum###
:     See [Networking](#Networking).

## R

###Rapid elasticity### {#RapidE}
:     The ability to scale cloud resources rapidly outward and inward commensurate with demand.  To the consumer, these capabilities available for provisioning often appear to be unlimited and can be appropriated in any quantity at any time.

###Reporting###
:    See [Telemetry and Reporting](#Reporting).

###Resource pooling### {#Pooling}
:     An attribute of cloud computing where computing resources are pooled to serve multiple consumers using a multi-tenant model. Different physical and virtual resources are dynamically assigned and reassigned according to consumer demand.

###REST### {#REST}
:     A model for providing web services of HTTP. Stands for Representational State Transfer. 

###Request Abstraction### {#RequestAbstraction}
:     A coding layer that provides programming-language-specific access to the underlying core code base REST API HTTP calls.  

For example, instead of including a call to the REST API by using HTTP **verb** (GET), path (/flavors), format (format=json), 
and the other HTTP attributes, using the request layer you can simplify the call to `list_flavors()` (the specific call depends on the 
details of your specific request layer syntax).  The request layer handles all HTTP request and response parsing and exception handling. Also known as the **request layer**.

###Role### {#Role}
:     A personality that a user assumes when performing a specific set of operations. A role includes a set of rights and privileges, which a user assuming that role inherits. Associated with the [Identity service](#Identity).

###Router IP###
:    IP Address of the device that passes network traffic between two different IP addresses as well as subnets.

## S

###Seed VM### {#Seed-Cloud}
:     A bootable image that is deployed into a virtual machine (VM). The seed VM is a [Kernel-based Virtual Machine](#KVM). See also [Undercloud](#Undercloud) and [Overcloud](#Overcloud). 

###Server### {#Server}
:     A compute instance that is created from a [flavor](#Flavor) combined with an [image](#Image).

###Swift### {#Swift}
:     See [Object Operations](#Object).

## T

###Telemetry and Reporting### {#Reporting}
:     The HP Helion OpenStack service that enables a single infrastructure to collect measurements within your cloud environment. Also known as [Ceilometer](#Ceilometer).

###Tenant### {#Tenant}
:    See [Project](#Project).

###Tenant ID### {#TenantID}
:    An ID linking one or more accounts to one or more subscribed services. APIs and Bindings often require a Tenant ID in addition to authentication information.

###Token### {#Token}
:    An arbitrary bit of text that is used to access resources. Each token has a scope that describes the resources are accessible with the token. Associated with the [Identity service](#Identity).

###TripleO### {#TripleO}
:    A program aimed at installing, upgrading and operating OpenStack clouds using OpenStack's own cloud facilities as the foundations - building on Nova, Neutron and Heat to automate fleet management at data centre scale (and scaling down to as few as two machines).

## U

###Undercloud### {#Undercloud}
:     An image that is deployed by the [Seed VM](#Seed-Cloud) onto a single physical machine. See also  and [Overcloud](#Overcloud).

###User###
:    A digital representation of a person who uses the cloud. Users are associated with [projects](#Projects) based on [roles](#Role) assigned to them with that tenant. Associated with the [Identity service](#Identity).



## V

###Virtual Local Area Network (VLAN)###
:     An architecture where devices appear to be physically connected.

###Virtual Cloud Networking (VCN)###
Virtual Cloud Networking (VCN) is an enhanced OpenStack Networking service (Neutron) that delivers network virtualization enabled by software-defined networking (SDN). SDN orchestrates the entire data canter infrastructure.

### Virtual Extensible LAN (VxLAN)### 
:      A network virtualization technology that addresses the scalability problems associated with large cloud computing deployments. It uses a VLAN-like encapsulation technique to encapsulate MAC-based OSI layer 2 Ethernet frames within layer 3 UDP packets.

###Virtual Storage Appliance (VSA)### {#VSA}
:    A virtual storage appliance (VSA) is a storage controller that runs on a virtual machine (VM) to create shared storage without the cost of additional hardware. See also [VSA cluster](#VSAcluster).

###VMWare ESXi hypervisor###
:    A [baremetal](#Baremetal) [hypervisor](#Hyper) that installs directly on top of your physical machine and partitions the machine into multiple virtual machines.

###Volume (bootable)### {#VolumeBootable}
:     A bootable machine, previously saved by a user.

###Volume Operations### {#Volume}
:     The HP OpenStack service that provides volume management in cloud environments. Also known as [Cinder](#Cinder).

###VSA cluster### {#VSAcluster}
:    An architecture that includes multiple ESXi hosts and provides shared datastores that are connected to all hosts in the datacenter. See also [Virtual Storage Appliance](#VSA).

## W

###Wired for Management (WfM)### {#WFM)
:     A technology allowing a [baremetal](#Baremetal) node to be controlled by a master computer. The master computer can install and update software and monitor computer status remotely. Intel developed the technology in the 1990s.

## X

## Y

## Z

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


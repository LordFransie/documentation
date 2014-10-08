---
layout: default
title: "HP Helion OpenStack&#174; Object Operations Service Overview"
permalink: /helion/openstack/services/object/overview/
product: commercial.ga

---
<!--PUBLISHED-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!--
<p style="font-size: small;"> <a href="/helion/openstack/services/networking/overview/">&#9664; PREV</a> | <a href="/helion/openstack/services/overview/">&#9650; UP</a> | <a href="/helion/openstack/services/orchestration/overview/"> NEXT &#9654</a> </p>-->

# HP Helion OpenStack&#174; Object Storage Service Overview #

<!-- modeled after HP Cloud Networking Getting Started (network.getting.started.md) -->

HP Helion OpenStack&#174; introduces integral, built-in support for [Scale-out Swift](/helion/openstack/services/object/overview/scale-out-swift/) to the cloud.
The HP Helion OpenStack&#174; cloud deployment includes automatic creation of a Swift cluster and starter nodes.

Based on OpenStack&reg; Swift, the HP Helion OpenStack object storage service provides a highly available, resilient, and scalable storage pool for unstructured data.  

##Architecture Overview
At its core, Swift is built from a set of software services and data constructs hosted on a cluster of servers. 

A Swift cluster is software defined storage (SDS) architecture layered on top of industry standard servers using standard storage drives. 

The services in the Swift cluster are either ***access*** services or ***storage*** services.

- The *access* services group is made up of the Swift Proxy Servers, which run Swift-Proxy, Account and Container Services, HTTP/HTTPS load balancers, and OpenStack Keystone authentication service.
- The *storage* services group is composed of Swift Object Servers and various background services such as replicators.  
 
Each service group can be scaled ***independently*** to meet workload and redundancy requirements. The storage service can be scaled up as necessary ([scale-out Swift](/helion/openstack/services/object/overview/scale-out-swift/)) and is also horizontally scalable to handle an increased number of simultaneous connections. 

##Expanding the Swift Deployment

Note that the initial installation of Helion OpenStack cloud includes the creation and configuration of a basic two-node Starter All-in-one Swift deployment. Any additional rings, nodes or servers are expansions of this basic installation.

For more information and in-depth diagrams, see [About Scale-Out Swift](/helion/openstack/services/object/overview/scale-out-swift/).

1. Deploy Starter Swift<br>*(completed as part of the HP Helion OpenStack cloud deployment)*
3. Scale up or expand 
	- [Deploy New Swift Object Storage](/helion/openstack/services/swift/deployment-scale-out/)
	-  [Add New Storage Servers](/helion/openstack/services/swift/provision-nodes)
	-  [Extend a Swift Cluster](/helion/openstack/services/object/swift/expand-cluster/)
	-  [Add a New Scale-out Object Node](/helion/openstack/services/swift/deployment/add-disk-object-node/)
	-  [Add a New Scale-out Proxy Node](/helion/openstack/services/swift/deployment/add-proxy-node/)
	-  [Add a Disk to a Scale-out Object Ring](/helion/openstack/services/swift/deployment/add-disk-scale-out/)
	-  [Add a Disk to an Account and Container Ring](/helion/openstack/services/swift/deployment/add-disk-account-container/)
	-  [Add a Disk to the Starter Object Ring](/helion/openstack/services/swift/deployment/add-disk-starter/)
5. Shrink or scale down
	- [Remove a disk from an Object Node](/helion/openstack/services/swift/deployment/remove-existing-disk/)
	- [Remove a Proxy Node](/helion/openstack/services/swift/deployment/remove-proxy-node/)
	- [Removing a scale-out Object Storage Node](/helion/openstack/services/swift/deployment/remove-scale-out-object-node/)
6. Monitor
	- [Monitor Swift Cluster](/helion/openstack/services/object/swift/Monitor-cluster/)
	- [Disk usage](/helion/openstack/services/object/swift/Monitor-disk/)
	- [Replication status](/helion/openstack/services/object/swift/replica-status/)
	- [Service health](/helion/openstack/services/object/swift/health-check/)

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*

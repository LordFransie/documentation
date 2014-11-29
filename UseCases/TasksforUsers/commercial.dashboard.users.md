---
layout: default
title: "HP Helion OpenStack&#174; Using the Dashboard as a Non-Admin User"
permalink: /helion/commercial/dashboard/managing/nonadmin/
product: commercial.ga

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!--
<p style="font-size: small;"> <a href="/helion/commercial/ga1/install/">&#9664; PREV</a> | <a href="/helion/commercial/ga1/install-overview/">&#9650; UP</a> | <a href="/helion/commercial/ga1/">NEXT &#9654;</a> 
-->

# HP Helion OpenStack&#174; Using the Dashboard as a Non-Admin User 

As a non-admin user, you can use the dashboards to manage your cloud environment.

**Note:** Administrators can perform all of the user tasks in addition to the <a href="/helion/commercial/dashboard/managing/admin/">admin tasks</a>.

### Managing instances ###

You can use the dashboards to manage instances to which you have access. 

You can create new instances. You can reboot, rebuild, pause, suspend any existing instance that you can access.

For more information, see <a href="/helion/commercial/dashboard/managing/instances/users/">Managing Instances with HP Helion OpenStack Community</a>.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


### Managing networks ###
/
A network is a pluggable, scalable system for managing networks and IP addresses.

You can use the dashboards to create, delete, and configure your HP Helion OpenStack Community network. 

For more information, see <a href="/helion/commercial/dashboard/managing/networks/">Managing Networks with HP Helion OpenStack Community</a>.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


### Managing routers ###

Each network can be assigned a router, which provides a gateway to external networks. 

You can use the dashboard to create, delete, and configure your HP Helion OpenStack Community router, determine which networks connect to each router, and connect the router to an externally-available network, as needed.

For more information, see <a href="/helion/commercial/dashboard/managing/routers/">Managing Routers with HP Helion OpenStack Community</a>.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


### Managing floating IP addresses ###

Floating IP addresses allow external access to the instances in your network. When an instance is created, it is assigned an internal, private IP address. You can assign public floating IP address to an instance that you want to access externally.

You can use the dashboards to allocate and associate floating IP addresses to the instances on a network.

For more information, see <a href="/helion/commercial/dashboard/managing/ipaddresses/">Managing Floating IP Addresses with HP Helion OpenStack Community</a>.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


### Managing security ###

HP Helion OpenStack Community uses security groups and key pairs to control access to instances in your cloud.

You can use the dashboards to create, delete and configure security groups and security group rules to control access to your instance. You can also generate and import key pairs.

For more information, see <a href="/helion/commercial/dashboard/managing/security/">Managing Security with HP Helion OpenStack Community</a>.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


### Managing images ###

A virtual machine image is a single file which contains a virtual disk that has a bootable operating system installed on it. Images can be used to create instances.

You can use the dashboards to create and configure private virtual machine images.

For more information, see <a href="/helion/commercial/dashboard/managing/images/">Managing Virtual Machine Images with HP Helion OpenStack Community</a>.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

### Managing object storage containers ###

With object storage, objects and files are written to multiple disk drives spread throughout servers in the data center, with the Helion software responsible for ensuring data replication and integrity across the cluster. 

You can use the dashboards to create and configure container storage instances and move files in and out of storage.

For more information, see <a href="/helion/commercial/dashboard/managing/objects/">Managing Object Storage with HP Helion OpenStack Community</a>.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


### Managing volumes ###

Volumes are block storage devices that allow you to expand the storage capacity of an instance. Volumes may only be attached to one server at a time, and will retain data, even when not attached to an instance. 

You can create and configure volumes; create snapshots of volumes; update the metadata associated with a volume, extend the size of volumes, and attach and detach volumes from instances.

For more information, see <a href="/helion/commercial/dashboard/managing/volumes/">Managing Block Storage Volumes with HP Helion OpenStack Community</a>.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
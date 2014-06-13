---
layout: default
title: "HP Helion Public Cloud version 13.5 overview"
permalink: /version-overview/
product: public-cloud

---
# HP Helion Public Cloud version 13.5 overview
HP Helion Public Cloud is based on the open source cloud computing platform OpenStack core code base, releasing regular updates on the current tested and approved OpenStack versions.  One of the most significant changes is the addition of our new best-in-class software defined networking (SDN) for virtual private clouds. This new networking service provides enhanced network functionality and the ability to fine-tune and define your own virtual network.

In addition, you now have larger and more powerful instance types (sizes) to choose from--four times the size of the largest instances offered by most public clouds. And, our large, xlarge, and 2xlarge sizes are also offered in high memory versions. (See the [chart below](#sizes) for all available instance types.)

Putting all of this together, along with bulk data import capability, means that it's much simpler to move applications to the public cloud and to create applications for the public cloud. 

Since HP Helion Public Cloud Compute version 13.5 is based on the latest code from the OpenStack community there are now separate Networking and Block Storage services with API endpoints independent from the HP Helion Public Cloud Compute API.  In addition, the Image Management API is now exposed to users.  While you can continue to execute basic networking, block storage and image management commands through the HP Helion Public Cloud Compute API, these newly exposed interfaces provide you even more control and allow you access to new advanced features. 

Finally, the new versions of these services will now be closely tracking upstream OpenStack. This means that HP Helion Public Cloud will be releasing regular updates based on the latest tested and approved code submitted to OpenStack trunk, you'll always be working with the latest OpenStack code.

The sections below explain each piece of our service.

- [HP Helion Public Cloud Compute](#Compute)
- [Region-wide resources](#AZ)
- [Software Defined Networking](#Network)
- [Block Storage](#BlockSt)
- [Bulk data import](#BulkImp)

## HP Helion Public Cloud Compute ## {#Compute}
Based on the OpenStack Nova project, the HP Helion Public Cloud Compute service provides on-demand computing giving you the ability to provision and manage large clusters of instances (virtual machines). With the new version you have more flexibility to select the type of instance that meets the needs of your application without having to pay for additional resources.


###Instance types available### {#sizes}


<div style=" text-align: left; text-indent: 0px; padding: 0px 0px 0px 0px; margin: 0px 0px 0px 0px;"><table width="100%" border="1" cellpadding="2" cellspacing="2" style="background-color: #ffffff;">
<th valign="top">
<td style="border-width : 0px;">Size<br />
</td> 
<td style="border-width : 0px;">API Name <br />
</td>
<td style="border-width : 0px;">RAM (GB)<br />
</td>
<td style="border-width : 0px;"># of Cores<br />
</td>
<td style="border-width : 0px;">Total HP CCUs<br />
</td>
<td style="border-width : 0px;">Disk Size<br />
</td>
</th>
<tr valign="top">
<td style="border-width : 0px;">XS&#42;<br />
</td>
<td style="border-width : 0px;">standard.xsmall <br />
</td>
<td style="border-width : 0px;">1<br />
</td>
<td style="border-width : 0px;">1<br />
</td>
<td style="border-width : 0px;">1<br />
</td>
<td style="border-width : 0px;">20GB<br />
</td>
</tr>
<tr valign="top">
<td style="border-width : 0px;">S<br />
</td>
<td style="border-width : 0px;">standard.small <br />
</td>
<td style="border-width : 0px;">2<br />
</td>
<td style="border-width : 0px;">2<br />
</td>
<td style="border-width : 0px;">2<br />
</td>
<td style="border-width : 0px;">40GB<br />
</td>
</tr>
<tr valign="top">
<td style="border-width : 0px;">M<br />
</td>
<td style="border-width : 0px;">standard.medium<br />
</td>
<td style="border-width : 0px;">4<br />
</td>
<td style="border-width : 0px;">2<br />
</td>
<td style="border-width : 0px;">2<br />
</td>
<td style="border-width : 0px;">80GB<br />
</td>
</tr>
<tr valign="top">
<td style="border-width : 0px;">L<br />
</td>
<td style="border-width : 0px;">standard.large<br />
</td>
<td style="border-width : 0px;">8<br />
</td>
<td style="border-width : 0px;">4<br />
</td>
<td style="border-width : 0px;">8<br />
</td>
<td style="border-width : 0px;">160GB<br />
</td>
</tr>
<tr valign="top">
<td style="border-width : 0px;">XL<br />
</td>
<td style="border-width : 0px;">standard.xlarge<br />
</td>
<td style="border-width : 0px;">15<br />
</td>
<td style="border-width : 0px;">4<br />
</td>
<td style="border-width : 0px;">15<br />
</td>
<td style="border-width : 0px;">300GB<br />
</td>
</tr>
<tr valign="top">
<td style="border-width : 0px;">2XL<br />
</td>
<td style="border-width : 0px;">standard.2xlarge<br />
</td>
<td style="border-width : 0px;">30<br />
</td>
<td style="border-width : 0px;">8<br />
</td>
<td style="border-width : 0px;">30<br />
</td>
<td style="border-width : 0px;">570GB<br />
</td>
</tr>
<tr valign="top">
<td style="border-width : 0px;">4XL<br />
</td>
<td style="border-width : 0px;">standard.4xlarge&#42;&#42;<br />
</td>
<td style="border-width : 0px;">60<br />
</td>
<td style="border-width : 0px;">8<br />
</td>
<td style="border-width : 0px;">60<br />
</td>
<td style="border-width : 0px;">1100GB<br />
</td>
</tr>
<tr valign="top">
<td style="border-width : 0px;">8XL<br />
</td>
<td style="border-width : 0px;">standard.8xlarge&#42;<br />
</td>
<td style="border-width : 0px;">120<br />
</td>
<td style="border-width : 0px;">16<br />
</td>
<td style="border-width : 0px;">120<br />
</td>
<td style="border-width : 0px;">2200GB<br />
</td>
</tr>
</table>
</div>
<p>
<b>High memory versions</b></p>


<div style=" text-align: left; text-indent: 0px; padding: 0px 0px 0px 0px; margin: 0px 0px 0px 0px;"><table width="100%" border="1" cellpadding="2" cellspacing="2" style="background-color: #ffffff;">
<th valign="top">
<td style="border-width : 0px;">Size<br />
</td>
<td style="border-width : 0px;">API Name<br />
</td>
<td style="border-width : 0px;">RAM (GB)<br />
</td>
<td style="border-width : 0px;"># of Cores<br />
</td>
<td style="border-width : 0px;">Total HP CCUs<br />
</td>
<td style="border-width : 0px;">Disk Size<br />
</td>
</th>
<tr valign="top">
<td style="border-width : 0px;">High Mem-L <br />
</td>
<td style="border-width : 0px;">highmem.large&#42;&#42;<br />
</td>
<td style="border-width : 0px;">16<br />
</td>
<td style="border-width : 0px;">4<br />
</td>
<td style="border-width : 0px;">8<br />
</td>
<td style="border-width : 0px;">160GB<br />
</td>
</tr>
<tr valign="top">
<td style="border-width : 0px;">High Mem-XL<br />
</td>
<td style="border-width : 0px;">highmem.xlarge&#42;&#42;<br />
</td>
<td style="border-width : 0px;">30<br />
</td>
<td style="border-width : 0px;">4<br />
</td>
<td style="border-width : 0px;">15<br />
</td>
<td style="border-width : 0px;">300GB<br />
</td>
</tr>
<tr valign="top">
<td style="border-width : 0px;">High Mem-2XL<br />
</td>
<td style="border-width : 0px;">highmem.2xlarge&#42;<br />
</td>
<td style="border-width : 0px;">60<br />
</td>
<td style="border-width : 0px;">8<br />
</td>
<td style="border-width : 0px;">30<br />
</td>
<td style="border-width : 0px;">570GB<br />
</td>
</tr>
</table>
</div>

<p>
<b>&#42;</b>Running an extra small (XS) Windows instance requires a 30GB local disk. In order to run an XS Windows instance you must create a bootable block storage volume and run your Windows instance from this.
</p>
<p>
<b>&#42;&#42;</b>New sizes/configurations</p>

**Note:** An HP Helion Public Cloud Compute Unit (CCU) is a unit of CPU capacity that describes the amount of compute power that a virtual core has available to it. Thus 6.5 CCUs are roughly equivalent to the minimum power of one logical core (a hardware hyper-thread) of an Intel&reg; 2012 Xeon&reg; 2.60 GHz CPU.

## Region-wide resources ## {#AZ}
Each region--US East and US West--consists of three physically isolated availability zones in which you can create instances and/or block storage volumes. You can use resources spread across multiple availability zones to create an application with high availability.  When you work in a region, the following objects are region wide:

- Images
- Floating IPs
- Network definitions
- Security group definitions
- Keypairs
- SSH keys

If you start from the Management Console you can select the availability zone that you want your instance or volume to reside. You can also list and select availability zones from the API:

    $ nova availability-zone-list

    +----------+---------------+
    | Name     | Status        |
    +----------+---------------+
    | az1      | available     |
    | az2      | available     |
    | az3      | available     |
    +----------+---------------+
Using the API, you can also specify the availability zone when you create an instance or volume using `-availability_zone az#`

For example: `$ nova boot ... --availability-zone az1 ...`

If you don't specify an availability zone, the Compute or Storage service automatically assigns one. So, if you do require redundancy for your virtual machines or volumes make sure to specify different availability zones for each.

**Important:** Volumes can only be attached to servers created in the same availability zone.

## Software Defined Networking ## {#Network}
HP Helion Public Cloud v13.5 builds on the OpenStack Neutron service complemented with Software Defined Networking (SDN) technology from HP Networking to offer more robust and flexible networking capabilities to rapidly customize your network as needed. Then, you can simply connect it with your existing on-premise datacenter via a VPN tunnel. Spinning up a Compute service instance automatically configures

- A default network 
- A subnet
- A router connected to the subnet and externally to the Internet
- A security group with basic server options

Our [Networking API](/api/v13/networking/) or the [Management Console](/mc/compute/networks/) exposes a rich set of additional functionality including the ability to 

- Define and configure your own private Virtual L2 Networks
- Establish Virtual Private Network (VPN)  
- Specify IP address ranges and security group parameters that define the firewall rules for your instances to ensure they don’t conflict with your existing on-premise network
- Allocate and manage public floating IP addresses
- Connect to a specific network
- Connect an instance to more than one network
- Establish a Virtual Private Network (VPN) connection between the networks you create and your existing on-premise network

You also have the ability to set communication rules (security group rules) for both inbound and outbound traffic, create separate networks with their own IP address ranges, and control how servers connect to them.  As a region-wide service you have the ability to

- Use a single API endpoint per region 
- Connect networks in different Availability Zones to the same virtual L2 network
- Have your security groups span all Availability Zones in a region
- Map floating IP addresses to any Availability Zone in a region

## Block Storage ## {#BlockSt}
Block storage has always been available in the HP Helion Public Cloud Compute service, but now HP Helion Public Cloud provides it as a separate but integrated service based on OpenStack Cinder.  Block storage provides persistent, manageable volumes along with the ability to take a snapshot of a volume.   Bootable volumes can be created from images in the Image Management service and these bootable volumes can be used to create persistent instances.  The physical implementation of our storage solution is based on technology developed in HP labs and provides enterprise class volume availability.

## Bulk data import ## {#BulkImp}
Bulk import means we load your data into HP Helion Public Cloud Block Storage or HP Helion Public Cloud Object Storage--just send a hard drive directly to the HP data centers where we rapidly transfer your data to the cloud. Get apps with big data sets to the HP Helion Public Cloud quickly and easily.

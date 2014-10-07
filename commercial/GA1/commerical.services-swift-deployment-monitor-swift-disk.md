---
layout: default
title: "HP Helion OpenStack&#174; Monitor Disk Usage"
permalink: /helion/openstack/ga/services/object/swift/Monitor-disk/
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
<p style="font-size: small;"> <a href="/helion/openstack/ga/services/object/overview/">&#9664; PREV</a> | <a href="/helion/openstack/services/overview/">&#9650; UP</a> | <a href=" /helion/openstack/ga/services/swift/deployment/"> NEXT &#9654</a> </p>-->


# HP Helion OpenStack&#174;: Monitor Disk Usage

The ***Icinga*** service, which runs in the undercloud, helps cloud admins monitor the disk usage of Swift storage node(s).


##Prerequisites

* HP Helion OpenStack&#174; cloud is successfully deployed. 
* Starter Swift nodes are functional by default as they are part of cloud deployment
* The Icinga service is active and running in the undercloud


##Monitoring Disk Usage of Swift 

Icinga checks the following:

- That the file systems used by the servers are mounted. 
- The disk usage (by percentage) for the devices in use by Swift (/srv/node). 

Note that other file systems such as `/usr` or `/var` are not monitored. 

Perform the following steps to monitor the usage of Swift disk:

1. In the undercloud Horizon dashboard, log in to the [Icinga Dashboard](http://<Undercloud_IP>/icinga/). The default login credentials are as follows::
		
	* Username: *icingaadmin*
	* Password: *icingaadmin* 

2. Click **Status** on the left panel and then click 
<a href="javascript:window.open('/content/documentation/media/icinga_host-details.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')"><b>Host Details</b></a> (opens in a new window).

3. In the **Host** column, click the icon next to the host IP (with tooltip that shows View Service Details For This Host) of the Swift storage node that you want to monitor.
4. The <a href="javascript:window.open('/content/documentation/media/swift_icinga_view-details.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')"><b>Service Status Details For Host All Hosts</b></a> (opens in a new window) page opens.

6. Click the target Swift node IP address to open the  <a href="javascript:window.open('/content/documentation/media/swift_icinga-disk-usage','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')"><b>Service Status Details For Host &lt;Swift node IP address &gt;</b> (opens in a new window)</a> to view the disk usage of the selected Swift node.

##Status Messages

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
	<th>Status</th>
	<th><center>Message</center></th>
    <th><center>Cause/Resolution</center></th>
</tr>
<tr style="background-color: white; color: black;">
	<td>OK</td>
	<td>No devices to report</td>
    <td> This message appears on Proxy servers where there are no account, container or object servers configured. This is a normal status.</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>OK </td>
	<td>Percent used</td>
    <td> Percent disk usage for devices used by Swift (/srv/node)</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>WARNING </td>
	<td>Disk space low</td>
    <td>The percentage used space of one of the disk drives exceeds the user defined threshold(Default set to 85% for HP Helion OpenStack 1.0). It is important to prevent Swift devices becoming full because it is difficult to recover if this happens. To resolve, add more devices to the rings or ask your users to delete objects.</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>FAIL </td>
	<td>Disk space critically low</td>
    <td>The available space on one of the disk drives has dropped below the "fallocate_reserve" given in <object-server-configuration>. If no value is given in the object server configuration file, this is defaulted to zero. Swift cannot store more data on the drive, if the available space drops below this defined limit.</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>FAIL </td>
	<td>Not mounted</td>
    <td> The named device is not mounted. The device may have failed to mount or was unmounted due to an error. To resolve, stop all Swift processes, mount all devices and restart Swift.</td>
</tr>
<tr style="background-color: white; color: black;">
	<td>UNKNOWN</td>
	<td>No devices to report</td>
    <td></td></tr>
</table>

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*

 




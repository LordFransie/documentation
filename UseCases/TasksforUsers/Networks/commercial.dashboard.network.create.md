---
layout: default
title: "HP Helion OpenStack&#174; Creating or Deleting Networks"
permalink: /helion/commercial/dashboard/managing/network/create/
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

# HP Helion OpenStack&#174; Creating or Deleting Networks

A network is a pluggable, scalable and API-driven system for managing networks and IP addresses.

A non-admin user or admin user can <a href="#createnet">create</a> and <a href="#deletenet">delete</a> networks as needed. 

### Create a network ### {#createnet}

1. [Launch the HP Helion OpenStack Helion Dashboard](/helion/openstack/dashboard/login/).

2. Click the **Networks** link on the **Project** dashboard **Network** panel.

	The network(s) for the selected project appear. 

3. Click **Create Network**.

4. On the **Network** tab:

	* Enter a name for the network.</li>
	* Leave **Admin State** selected to launch the network in the enabled state or clear the field to disable the new network.</li>

5. Click **Next** to configure a subnet for the network.

6. On the **Subnet** tab:

	* Enter the subnet name.</li>
	* Enter a network address range for the subnet in CIDR (Classless Inter-Domain Routing) format in the **Network Address** field, for example: 192.168.0.0/24.</li>
	* Select IPv4 or IPv6, as appropriate, in the IP Version field.</li>
	* Enter a gateway IP address from the subnet or leave the **Gateway IP** field blank to use the default value for the gateway IP address; for example, 192.168.0.1 for 192.168.0.0/24.</li>
	* Leave **Disable Gateway** clear to enable the default gateway for this network, or select **Disable Gateway** to create the network with no default gateway.</li>
	* Determine if the network is to be available in all projects in the domain or only the selected project: 

		* Select **Shared** to make the network available in all projects.</li>
		* Leave the **Shared** option clear to limit the network to the selected project. </li>
	* Determine if the network is to be available externally or only internally: 

		* Select **External Network** to make the network an externally accessible.</li>
		* Leave the **External Network** option clear to make the network internal, only accessible from the external network through a network router. </li>

7. Click **Next**.

8. On the Subnet Details tab:

	* Clear the **Enable DHCP** option, as needed, to not use the network as a DCHP. DHCP is enabled by default. If enabled, the subnet will serve as your DHCP server. Instances associated with the subnet will be assigned an IP address from this pool. .</li>
	* Optionally, enter the starting and ending IP addresses you want for your DHCP allocation pool in the **Allocation Pools** field, in the format IP<em>ADDR,IP</em>ADDR. For example: 192.168.1.10,192.168.1.120. By deafult, the server has an application pool starting with 10.0.0.0/24.	</li>
	* Optionally, enter the IP Address of your subnet in the **DNS Name Servers** field. If blank, your subnet will default to using HP's internal DNS which uses DNSMASQ.</li>
	* Optionally, enter the Destination CIDR and Next Hop for your subnet in the Host Routes field to create host routes.</li>

9. Click **Create**.  

### Delete a network ### {#deletenet}

1. [Launch the HP Helion OpenStack Helion Dashboard](/helion/openstack/dashboard/login/).

2. Click the **Networks** link on the **Project** dashboard **Network** panel.

	The network(s) for the selected project appear. 

3. For the network to delete, click **More &gt; Delete Network**.

4. In the confirmation screen, click **Delete Network**. 
<p>The network is deleted and any instances attached to the networks are disconnected.

5. <a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
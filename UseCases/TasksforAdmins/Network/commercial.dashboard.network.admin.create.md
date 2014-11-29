---
layout: default
title: "HP Helion OpenStack&#174; Creating Externally Available Networks"
permalink: /helion/commercial/dashboard/managing/network/external/create/
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

# HP Helion OpenStack&#174;  Creating Externally Available Networks

A network is a pluggable, scalable and API-driven system for managing networks and IP addresses.

A non-admin user or admin user can [create](#createnet) and [delete](#deletenet) networks as needed. 

### Create an externally available network ### {#createnet}

1. [Launch the HP Helion OpenStack Helion Dashboard](/helion/openstack/dashboard/login/).

2. Click the **Networks** link on the **Project** dashboard **Network** panel.

	The network(s) for the selected project appear. 

3. Click **Create Network**.

4. On the **Network** tab:

	a. Enter a name for the network.</li>

	b. Leave **Admin State** selected to launch the network in the enabled state or clear the field to disable the new network.</li>

	c. Determine if the network is to be available in all projects in the domain or only the selected project: 

	d. Select **Shared** to make the network available in all projects.</li>

	e. Leave the **Shared** option clear to limit the network to the selected project. </li>

5. Determine if the network is to be available externally or only internally: 

	a. Select **External Network** to make the network an externally accessible.</li>

	b. Leave the **External Network** option clear to make the network internal, only accessible from the external network through a network router. </li>

6. Click **Create Network**.  

To configure a subnet and ports for the network, see:

* [Add, Remove, or Modify a subnet](/helion/commercial/dashboard/managing/network/subnet/)
* [Create, Modify, or Delete a port](/helion/commercial/dashboard/managing/network/ports/)
</ul>

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
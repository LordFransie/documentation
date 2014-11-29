---
layout: default
title: "HP Helion OpenStack&#174; HP Helion OpenStack Commercial Manage Your Cloud"
permalink: /helion/commercial/dashboard/managing/aggregates/
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

# HP Helion OpenStack&#174; Managing Host Aggregates

A host aggregate is a method to subdivide availability zones into *hypervisor pools*, which is a collection of hypervisors grouped together into a collection of common hosts.

Host aggregates can be regarded as a mechanism to further partition an availability zone into multiple groups of hosts that share common resources like storage and network.

As an administrator you can manage the host aggregates in your domain:

* [Create a host aggregate](#createagg)
* [Modify a host aggregate](#editagg)
* [Delete a host aggregate](#deleteagg)

### Create a host aggregate ### {#createagg}

1. [Launch the HP Helion OpenStack Helion Dashboard](/helion/openstack/dashboard/login/).

2. Click the **Host Aggregates** link on the **Admin** dashboard **System** panel.

3. In the Host Aggregates screen, click **Create Host Aggregate**.

4. In the **Create Host Aggregate** screen, enter a descriptive name for the aggregate in the **Name** field.

5. Optionally, specify an availability zone in which the aggregate will be created.

6. Click the **Manage Hosts within Aggregate** tab.
 
7. Add hosts to the aggregate by clicking the **+** icon next to the host system you want to add.

8. Click **Create Host Aggregate**.

	A message is displayed on successful creation.

### Modify a Host Aggregate ### {#editagg}

1. [Launch the HP Helion OpenStack Helion Dashboard](/helion/openstack/dashboard/login/).

2. Click the **Host Aggregates** link on the **Admin** dashboard **System** panel.

3. Perform one of the following tasks:

	**To change the name or availability zone:**

	a. For the aggregate you want to edit click **Edit Host Aggregate**.

	b. Enter a new name and/or availability zone.

	c. Click **Save**.

	**To change the hosts associated with the aggregate:**

	a. For the aggregate you want to edit click *<em>More &gt; Manage Hosts</em></li>

	b. Add a host to the aggregate by clicking the **+** icon next to each project in the **All Available Hosts** column.</li>

	c. Remove a host from a aggregate by clicking the **-** icon in the **Selected Hosts** column.</li>

	d. Click **Save** when done.</li>

### Delete a host aggregate ### {#deleteagg}

1. [Launch the HP Helion OpenStack Helion Dashboard](/helion/openstack/dashboard/login/).

2. Click the **Host Aggregates** link on the **Admin** dashboard **System** panel.

3. In the Host Aggregates screen, for the aggregate you want to delete, click **More &gt; Delete Host Aggregate**.

4. In the confirmation screen, click **Delete Host Aggregate**.

	The host aggregate is removed.

<p><a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
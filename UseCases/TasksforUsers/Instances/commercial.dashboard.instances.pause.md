---
layout: default
title: "HP Helion OpenStack&#174; Pausing Instances"
permalink: /helion/commercial/dashboard/managing/instances/pause/
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

# HP Helion OpenStack&#174; Pausing and Un-pausing Instances

When a user *pauses* an instance, the instance  remains running, but, in a frozen state. The contents of the instance are stored in memory (RAM). Memory and vCPUs are not released.

Users can suspend an instance, for example, in order to make a back up of an instance to prevent the instance  from being used during the process.


**Note:** Pausing is different from <a href="/helion/commercial/dashboard/managing/instances/suspend/">suspending an instance</a>. Suspending stops the instance, stores the contents on the disk. the memory and vCPUs become available to create other instances.  


### Pause an instance ###

To pause an instance:

1. [Launch the HP Helion OpenStack Helion Dashboard](/helion/openstack/dashboard/login/).

2. Click the **Instances** link on the **Project** dashboard **Compute** panel.

3. In the **Instances** screen, for the instance you want to modify, click **More &gt; Pause Instance**.
<p>The status of the instance reports *Paused*. 

4. Note that many of the commands on the **More** menu are not available for a paused instance.

### Un-pause an instance ###

To unpause an instance:

1. [Launch the HP Helion OpenStack Helion Dashboard](/helion/openstack/dashboard/login/).

2. Click the **Instances** link on the **Project** dashboard **Compute** panel.

3. In the **Instances** screen, for the instance you want to modify, click **More &gt; Resume Instance**.

	Note that all of the commands on the **More** menu are available.

<p><a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
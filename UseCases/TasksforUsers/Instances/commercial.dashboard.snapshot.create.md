---
layout: default
title: "HP Helion OpenStack&#174; Creating Instance Snapshots"
permalink: /helion/commercial/dashboard/managing/snapshots/create/
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

# HP Helion OpenStack&#174; Creating an Instance Snapshot

A snapshot is a new image based on a running instance. That snapshot can be used as the base for new instances. 

### Creating a snapshot ###

To create a snapshot:

1. [Launch the HP Helion OpenStack Helion Dashboard](/helion/openstack/dashboard/login/).

2. Click the **Instances** link on the **Project** dashboard **Compute** panel.

3. In the **Instances** screen, for the instance you want to create a snapshot, click **Create Snapshot**.

4. On the **Create Snapshot** tab, enter a name for the snapshot.

5. Click **Launch** to launch the instance.

	A snapshot image is created on the **Images** link.

When you create a snapshot, by default the snapshot image can be used only with the current project and it can be deleted.

You can [make the snapshot public](/helion/commercial/dashboard/managing/images/public/) for use in all projects in the domain and you can [protect the image](/helion/commercial/dashboard/managing/images/protect/) from being deleted. 

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
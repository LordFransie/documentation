---
layout: default
title: "HP Helion OpenStack&#174; Protecting Images"
permalink: /helion/commercial/dashboard/managing/images/protect/
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

# HP Helion OpenStack&#174; Protecting Images

A virtual machine image is a single file that contains a virtual disk with a bootable operating system installed on it. You can use images to create virtual machine instances within the cloud. 

If you want to prevent an image from being deleted, you can make that image <em>protected</em>. 

### Protect an image ###

1. [Launch the HP Helion OpenStack Helion Dashboard](/helion/openstack/dashboard/login/).

2. Click the **Images** link on the **Project** dashboard **Compute** panel.

3. In the **Images** screen, for the image you want to protect, click **More &gt; Edit**.

4. In the **Update Image** screen, select **Protected**.

5. Click **Update Image**.

The image is protected and the **Delete Image** command is removed from the **More** menu.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
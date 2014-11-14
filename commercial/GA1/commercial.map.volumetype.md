---
layout: default
title: "HP Helion OpenStack&#174; Edition: Manage Storage"
permalink: /helion/openstack/map/volumetype/
product: commercial.ga

---
<!--PUBLISHED-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!---
<p style="font-size: small;"> <a href="/helion/openstack/install-beta/kvm/">&#9664; PREV</a> | <a href="/helion/openstack/install-beta-overview/">&#9650; UP</a> | <a href="/helion/openstack/install-beta/esx/">NEXT &#9654;</a> </p> -->


# HP Helion OpenStack&#174;: Mapping Backend to Volume Type

You can use the newly added Cinder backend, create volume type and associate it with this backend using the Horizon Overcloud dashboard or Cinder CLI. The following sections explains how to create Volume Type and map to a given backend for Cinder using Overcloud Horizon dashboard.


The page covers the following tasks:
 
* [Before you begin](#before-you-begin)

* [Create a volume type](#create-volume-type)

* [Associate the volume type to a backend](#associate-the-volume-type)


##Before you begin{#before-you-begin}

Before you start working with volume types, ensure that the following prerequisites have been fulfilled:

1. HP Helion Cloud is deployed

2. Cloud is created and is created and the Cinder service is up and running

## Create Volume type {#create-volume-type}

To create a volume type using Overcloud dashboard, do the following:

1. Login to Overcloud Horizon dashboard.<br> The Overcloud dashboard displays with the options in the left panel.  

2. From the left panel, click the **Admin** Tab and then click **Volumes** to display the Volumes page. 

	<a href="javascript:window.open('/content/documentation/media/create-volumetype.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Create Volume Type Option (opens in a new window)</a>

3. Click **Create Volume Type** to display a dialog box.

	<a href="javascript:window.open('/content/documentation/media/create-volumetype1.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Create Volume Type Dialog Box(opens in a new window)</a>

4. Enter the name of the volume type.

5. Click **Create Volume Type**.<br>The newly created volue displays in the Volumes page.


## Associate the volume type to a backend

To map a volume type to a backend, do the following:

1. Login to Overcloud Horizon dashboard.<br> The Overcloud dashboard displays with the options in the left panel.

2. From the left panel, click the **Admin** Tab and then click **Volumes** to display the Volumes page. 

3. Click **View Extra Specs** displayed against the volume type which you want to associate to the backend.<br> Create Volume Type Extra Specs dialog box is displayed.

	<a href="javascript:window.open('/content/documentation/media/view-extra-specs.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">View Extra Specs Option (opens in a new window)</a>

	<a href="javascript:window.open('/content/documentation/media/view-extra-specs1.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')"> Create Volume Type Extra Specs Dialog Box (opens in a new window)</a>

4. In the **Key** box, enter the name of the key of the backend to which you want to associate the volume type. For example:volume&#095;backend_name.

5. In the **Value** box, enter the name of the backend to which you want to associate the volume type.For example:FC_backend01.

6. Click **Create** to create the extra volume type specs.


**Note**: Once the volume type are mapped to the backends, the cloud user can create volumes.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*


---
layout: default
title: "HP Helion OpenStack&#174; Obtaining the Patch Update"
permalink: /helion/openstack/update/download/101/
product: commercial.ga

---
<!--PUBLISHED-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>
<!--
<p style="font-size: small;"> <a href="/helion/openstack/">&#9664; PREV | <a href="/helion/openstack/">&#9650; UP</a> | <a href="/helion/openstack/faq/">NEXT &#9654; </a></p>
-->
# HP Helion OpenStack&reg; Obtaining the Patch Update Package

An HP Helion OpenStack patch update is a series of images and scripts that enhance functionality or fix issues found in a previous Helion release.  

Before beginning the update, obtain the patch update package using one of the two following methods:

* Using the Helion Distribution Network by connecting to the catalog.
* Importing a local copy when there is no network connectivity or when the user would like to obtain the latest files that are not yet published in the catalog.

## Downloading from the Catalog

To use the Helion Distribution Network (HDN) to download the patch update from the catalog.

1. [Log in to the Sherpa UI on the undercloud](/helion/openstack/services/sherpa/accessing/).

2. Navigate to **Admin -> Updates and Extensions -> Updates and Extensions**.

3.	Click **Configure** to authenticate to the Helion Distribution Network.

4. Provide the credentials if you have already signed up, if not, sign up by clicking the **Sign up now** link.  

	<img src="media/SherpaConfigure.png">

5. Select patch update file and click **Download** from from {HP Helion OpenStack product installation](https://helion.hpwsportal.com/catalog.html#/Home/Show)

	<table style="text-align:left; vertical-align:top; width:650px;">
	
		<tr style="background-color: lightgrey; color: black;">
		<td><b> Installation package </b></td><td><b>File name</b></td></tr>

		<tr>
		<td>HP Helion OpenStack Upgrade</td><td>HP_Helion_OpenStack_1.0_to_1.0.1_Update.csu</td></tr>
		</table>

	The patch update file might take a long time to download, depending upon your connection speed.  
	
7. When the download is complete, click this **Publish** button to extract the package contents into the undercloud repositories necessary to perform the update.


## Importing a Local Copy ##

If you have no internet access on the undercloud or you prefer not to use the internet, you can download directly from the download site using a browser. Then move or copy the patch update file to the undercloud node. 

1. Use a browser on a separate system that has internet access and navigate to: [https://helion.hpwsportal.com/](helion.hpwsportal.com).

2. Log in using your HP Web ID.

3. Locate the patch update file and click **Download**. You should have received and email with the patch update file name and location.

	The patch update file might take a long time to download, depending upon your connection speed.  

4. Use a method as appropriate for your organization to move or copy the patch update file to the undercloud.

5. [Log in to the Sherpa UI on the undercloud](/helion/openstack/services/sherpa/accessing/).

	You can find your password from the seed VM. Use SSH to access the seed VM and use the following command:

		cat tripleo/tripleo-undercloud-passwords

6. Navigate to **Admin -> Updates and Extensions -> Updates and Extensions**.

7.	Click the **Import** button on top right corner.

8.	Select the CSU patch update file to download.

9.	Click **Import** to deliver the patch update file for further processing.

	<img src="media/SherpaImport.png">

10. Once the import of the package is complete, click the **Publish** button next to the package to extract the downloaded package contents into the undercloud repositories necessary to perform the update.

**Note:**  If you have published the same CSU multiple times, the Publish function will upload multiples copies of overcloud images into the Image Operations (Glance) service. You can delete the duplicate images by using the `build_no` property of the glance image.

## Next Steps {#next-steps}

Review the Prerequisites for information or tasks that need to be performed before starting the update. 

For prerequisites, see the [Update Prerequisites](/helion/openstack/update/prereqs/101/).


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*


 
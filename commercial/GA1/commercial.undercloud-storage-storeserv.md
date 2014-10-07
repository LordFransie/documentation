---
layout: default
title: "HP Helion OpenStack&#174; Edition: Manage Storage"
permalink: /helion/openstack/ga/undercloud/storage/storeserv/
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
<p style="font-size: small;"> <a href="/helion/openstack/install-beta/kvm/">&#9664; PREV</a> | <a href="/helion/openstack/install-beta-overview/">&#9650; UP</a> | <a href="/helion/openstack/install-beta/esx/">NEXT &#9654;</a> </p>-->

<!--what is HP Helion CLoud referring to in bullet 1??-->

# HP Helion OpenStack&#174; Working with HP 3PAR StoreServ

The StoreServ option allows you to configure HP 3PAR StoreServ as storage. HP 3PAR StoreServ is also referred to as 3PAR. Before you start working with StoreServ, ensure that it is accessible from the Undercloud and you have all the required details to register the device using Sirius service.

You can configure a 3PAR device by using the Undercloud Horizon Dashboard(*Recommended*) or [Sirius client](/helion/openstack/ga/sirius/cli/workflow/). This page describes the different tasks that you can perform using the StoreServ option in the Undercloud Horizon.<!---the following prerequisites have been fulfilled:-->

<!---6. The HP 3PAR REST service is running and HTTPS is enabled.-->



<!---Configuration of HP StoreServ/3PAR as Cinder backend using Sirius service involves the following steps:-->

* [Before you begin](#before-you-begin)

* [Register a 3PAR device](#registering-device)

	* [Edit a 3PAR StoreServ](#edit-storeserv)
	
    * [Unregister a 3PAR StoreServ](#unregister-storeserv) 
    
	* [Unregister multiple 3PAR StoreServs](#unregister-multiple-storeservs) 

* [Register a Common Provisioning Group(CPG)s](#registering-cpg)

	* [Edit a CPG](#edit-cpg) 
	
	* [Unregister a CPG](#unregister-cpg)
	
	* [Unregister multiple CPGs](#unregister-multiple-cpgs)
	
	* [View CPG configuration](#view-cpg)

* [Next Steps](#next-steps)


# Before you begin {#before-you-begin}

Before you start working with 3PAR StoreServ, ensure that the following prerequisites have been fulfilled:

1. HP Helion Cloud is deployed

2. The HP 3PAR StoreServ device is accessible from the Undercloud

3. The HP 3PAR StoreServ device (running operating system v 3.1.3 or later) is accessible by the Compute nodes and Cinder running in the Overcloud

4. Common Provisioning Groups (CPGs) are created for HP 3PAR StoreServ

## Register a 3PAR device {#registering-device}

To register the device using the Undercloud Horizon Dashboard, do the following:

1. Log in to the Undercloud Horizon Dashboard.

2. From the left panel, click the **Resources** tab and then **Storage** to display the overview page.

3. Select the **StoreServ** option to activate it.<br> The HP StoreServ page is displayed.

	<a href="javascript:window.open('/content/documentation/media/undercloud-storeserv-main-page.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">HP 3PAR StoreServ Main Page (opens in a new window)</a>

4. Click **Register StoreServ** displayed on the top right corner of the page to display the Register 3PAR StoreServ dialog box.

	<a href="javascript:window.open('/content/documentation/media/undercloud-storeserv-register-storeserv.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Register StoreServ Dialog Box (opens in a new window)</a>

5. In the dialog box, do the following:

    * In the **Name** box, enter the name for the 3PAR array.
   
    * In the **IP Address** box, enter the IP address of the 3PAR Web Service API Server.
   
    * In the **Username** box, enter the user name of the 3PAR super user.
   
    * In the **Password** box, enter the password of the 3PAR super user.
   
    * In the **Port** box, enter the Port for the 3PAR Web Service API service.
   
    * In the **SAN IP** box, enter the valid 3PAR IP address of the SAN controller for SSH access to the array.
   
    * In the **SAN username** box, enter the valid 3PAR user name of the SAN controller for SSH access to the array.
   
    * In the **SAN password** box, enter the valid 3PAR password of the SAN controller for SSH access to the array.
   
    * From the **Device Type** drop-down list, select the device type. For example: FC, iSCSI. <br> By default, the device type is **FC**.</br>
   
    * Click **Done** to save the details. 

    On successful registration, the 3PAR device is added and is listed as the **registered** StoreServ.

	<a href="javascript:window.open('/content/documentation/media/undercloud-storeserv-registered-storeserv.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Registered StoreServ in the HP StoreServ Main Page (opens in a new window)</a>

### Edit a 3PAR StoreServ {#edit-storeserv}

To edit the details of a StoreServ, do the following:

1. Log in to the Undercloud Horizon Dashboard.

2. From the left panel, click the **Resources** tab and then **Storage** to display the overview page.

3. Select the **StoreServ** option to activate it.<br> The HP StoreServ page is displayed.

4. Click **Edit StoreServ**. 

5. Make the required changes.

6. Click **Done** to save the changes.   


### Unregister a 3PAR StoreServ {#unregister-storeserv}

**Note**: Before you unregister the StoreServ, you need to unregister the CPG and remove the backend. Once the 3PAR is unregistered, neither the CPGs nor the volumes from these CPGs are accessible from the cloud.


Use this option to unregister a StoreServ.

1. Log in to the Undercloud Horizon Dashboard.

2. From the left panel, click the **Resources** tab and then **Storage** to display the overview page.

3. Select the **StoreServ** option to activate it.<br> The HP StoreServ page is displayed.

	<a href="javascript:window.open('/content/documentation/media/undercloud-storeserv-unregister-storeserv.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">UnRegister a StoreServ Option (opens in a new window)</a>

4. Click the **More** drop-down list against the StoreServ that you want to unregister and select **Unregister StoreServ**.<br> A confirmation box is displayed.

5. Click **Unregister StoreServ** to unregister, or click **Cancel** to cancel the process. 


### Unregister multiple 3PAR StoreServs {#unregister-multiple-storeservs}

Use this option to unregister multiple StoreServs using a single command.

1. Log in to the Undercloud Horizon Dashboard.

2. From the left panel, click the **Resources** tab and then **Storage** to display the overview page.

3. Select the **StoreServ** option to activate it.<br> The HP StoreServ page is displayed.

4. Click the checkbox displayed against the **Name** column to select all the StoreServs. 

5. Click **Unregister StoreServ** to unregister the StoreServs.<br>A confirmation box is displayed.

5. Click **Unregister StoreServ** to unregister or click **Cancel** to cancel the process. 

 
## Register 3PAR StoreServ Common Provisioning Groups (CPGs) {#registering-cpg}

Once you register the 3PAR device, choose the CPGs for your cloud. CPG (Common Provisioning Group) is a fundamental unit that can be configured as a Cinder backend. A single HP 3PAR StoreServ may have multiple CPGs. You can choose and allocate them to the cloud as a per your requirement. <!---First register the CPG in Sirius and then configure the CPG as backend for Overcloud Cinder service. You can register a few CPGs and allocate them as and when required. The Cinder configuration file is updated only during the allocation, the registeration of the CPG just updates the Sirius database.-->

**Note**: Only registered CPG(s) can be configured as a storage backend for Cinder.

To register the CPGs, do the following:

1. Log in to the Undercloud Horizon Dashboard.

2. From the left panel, click the **Resources** tab and then **Storage** to display the overview page.

3. Select the **StoreServ** option to activate it.<br> The HP StoreServ page is displayed with the list of StoreServs.

	<a href="javascript:window.open('/content/documentation/media/undercloud-storeserv-register-cpg.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Register CPG Option (opens in a new window)</a>

4. Click the **More** drop-down list against the StoreServ for which you want to register CPG and select **Register CPG**.<br> The Register CPG page is displayed with a list of CPGs that are present in the selected 3PAR array in the **Available CPG** box.</br>

	**OR**

	* Click the StoreServ device name for which you want to register the CPG. <br>The Common Provisioning Groups page is displayed with a list of CPGs.
    
	* Click **Register CPG**. <br>The Register CPG page is displayed with a list of CPGs that are present in the selected 3PAR array in the **Available CPG** box.</br> 

	<a href="javascript:window.open('/content/documentation/media/undercloud-storeserv-register-cpgpage.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Register CPG Page (opens in a new window)</a>

5. Select the desired CPG(s) from the **Available CPG** box list.

6. Click &rarr; to move the CPG(s)to the **Selected CPG(s)** box.<br> The CPG is displayed in the **Selected CPG(s)** box.

7. (Optional) Click **Choose All** displayed below the **Available CPG** box to select all the CPGs . 

8. (Optional) Click **Remove All** displayed below the **Selected CPG** box to move all the CPGs back to the **Available CPG(s)** or select the CPG(s) and click &larr; to move them back.

9. Click **Register** to register the CPG.

10. To check the status of CPG registration, in the HP StoreServ page, click the device name to display the Common Provisioning Groups page. The selected CPG displays as **registered**.
 
	 <a href="javascript:window.open('/content/documentation/media/undercloud-storeserv-registered-cpg.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Registered CPG Displays in the Common Provisioning Groups Page (opens in a new window)</a> 
    

### Edit a CPG {#edit-cpg}

**Note**: You cannot edit a CPG that is in *'Reserved'* state. Ensure that you enter a CPG name that already exists on the 3PAR device when you edit the CPG details.

To edit a CPG, do the following:

1. Log in to the Undercloud Horizon Dashboard.

2. From the left panel, click the **Resources** tab and then **Storage** to display the overview page.

3. Select the **StoreServ** option to activate it.<br> The HP StoreServ page is displayed with the list of StoreServs.

4. Click the StoreServ device name for which you want to register CPG. <br>The Common Provisioning Groups page is displayed with a list of CPGs.

5. Click **Edit CPG** against the CPG that you want to edit.<br> The Update CPG Details dialog box is displayed. 

6. Make the required changes.

7. Click **Done** to save the changes or click **Cancel** to cancel the process.  


### Unregister a CPG {#unregister-cpg}

 **Note**: When you unregister a CPG, the volumes from this CPG backend will no longer be available through Cinder. Ensure you detach all relevant volumes and remove the backend associated with the CPG before unregistering.

To unregister, do the following:

1. Log in to the Undercloud Horizon Dashboard.

2. From the left panel, click the **Resources** tab and then click **Storage** to display the overview page.

3. Select the **StoreServ** option to activate it.<br> HP StoreServ page is displayed.

4. Click the StoreServ device name for which you want to unregister CPG. <br>The Common Provisioning Groups page is displayed with a list of CPGs.<br> 

5. Click the **More** drop-down list against the CPG you want to unregister and select **Unregister CPG**.<br> A confirmation dialog box is displayed.

6. Click **Unregister CPG** to unregister or click **Cancel** to cancel the process.


### Unregister multiple CPGs {#unregister-multiple-cpgs}

Use this option to unregister multiple CPGs using a single command.

1. Log in to the Undercloud Horizon Dashboard.

2. From the left panel, click the **Resources** tab and then **Storage** to display the overview page.

3. Select the **StoreServ** option to activate it.<br> The HP StoreServ page is displayed.

4. Click the StoreServ device name for which you want to unregister the CPG. <br>The Common Provisioning Groups page is displayed with a list of CPGs.<br> 

5. Click the checkbox displayed against the **Name** column to select all the CPGs. 

5. Click **Unregister CPGs** to unregister the CPGs.<br>A confirmation box is displayed.

5. Click **Unregister CPGs** to unregister or click **Cancel** to cancel the process. 

### View CPG configuration {#view-cpg}

Use this option to view the CPG configuration (as defined in OpenStack Configuration Manual for HP 3PAR Cinder Block Storage Volume Driver).

1. Log in to the Undercloud Horizon Dashboard.

2. From the left panel, click the **Resources** tab and then **Storage** to display the overview page.

3. Select the **StoreServ** option to activate it.<br> The HP StoreServ page is displayed.

4. Click the StoreServ device name for which you want to view CPG configuration. <br>The Common Provisioning Groups page is displayed with a list of CPGs.<br> 

5. Click the **More** drop-down list against the CPG for which you want to view the configuration.<br> The configuration is displayed in a dialog box.</br>

6. Click **Close** to close and return to the Common Provisioning Groups page. 

##Next Steps {#next-steps}

[Working with StoreServ Backends](/helion/openstack/ga/undercloud/oc/config/storeserv/)


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*

---
layout: default
title: "HP Helion OpenStack&#174; Edition: Manage Storage"
permalink: /helion/openstack/ga/undercloud/oc/config/storevirtual/
product: commercial.ga

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!---<p style="font-size: small;"> <a href="/helion/openstack/install-beta/kvm/">&#9664; PREV</a> | <a href="/helion/openstack/install-beta-overview/">&#9650; UP</a> | <a href="/helion/openstack/install-beta/esx/">NEXT &#9654;</a> </p>-->


# Working With StoreVirtual Backends

Once you register the StoreVirtual systems as per your requirements, you can use the Overcloud option in the Undercloud Horizon Dashboard for the following tasks:

* [Add backend](#add-backend)

* [Expand backend](#expand-backend)

* [Shrink backend](#shrink-backend) 

* [Delete backend](#delete-backend)

* [Generate configuration](#generate-config)

* [Update Overcloud](#update-overcloud) 


### Add backend<a name="add-backend"></a>

Adding a StoreVirtual cluster as a backend moves the cluster to 'reserved' state which means that the cluster cannot be removed from the cloud unless the corresponding backends are removed.

To add a backend, do the following:

1. In the Configure Cloud page, click the **StoreVitual Backends** Tab.

	<a href="javascript:window.open('/content/documentation/media/undercloud-storevirtual-add-backend.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Configure Cloud Page (opens in a new window)</a>

2. Click **Add Backend** at the top to open the StoreVirtual Volume Backend page.

	<a href="javascript:window.open('/content/documentation/media/undercloud-storevirtual-add-backendoption.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">StoreVirtual Volume Backend Page (opens in a new window)</a>

3. In the **Volume Backend Name** box, enter the name for the backend.

4. From the **Available StoreVirtual Cluster Choices** box, select the cluster(s).

5. Click &rarr; to move the cluster to the **Selected StoreVirtual Cluster Choices** box. 

5.  (Optional) Click **Choose All** displayed below the **Available StoreVirtual Cluster Choices** box to select all the clusters . 

7. (Optional) Click **Remove All** displayed below the **Selected StoreVirtual Cluster Choices** box or select the cluster(s) and click &larr;to move the cluster(s) back to **Available StoreServ Choices** box. 

8. Click **Add**.<br>On successful addition of backend, the backend displays in the Backend Mapping table in the Configure Cloud page.</br>

	<a href="javascript:window.open('/content/documentation/media/undercloud-storevirtual-add-backendoption1.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Backend Displays in the Configure Cloud Page (opens in a new window)</a>


### Expand backend<a name="expand-backend"></a>

Expansion allocates new clusters to an existing backend. You can select the required clusters from the list of registered clusters and add them to a backend that has already been configured.

To expand a backend, do the following:

1. In the Configure Cloud page, click **StoreVirtual Backends** Tab to activate it.<br> The page displays a list of backends.</br>

	<a href="javascript:window.open('/content/documentation/media/undercloud-storevirtual-expand-backend.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Expand Backend Option (opens in a new window)</a>

2. Click **Expand Backend** against the backend that you want to expand.<br> Expand StoreVirtual Volume Backend page is displayed.</br>

	<a href="javascript:window.open('/content/documentation/media/undercloud-storevirtual-expand-backendoption1.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Expand Backend Page (opens in a new window)</a>

3. From the **Available StoreVirtual Cluster Choices** box, select the Cluster.

4. Click &rarr; to move the cluster(s)to the **Selected StoreVirtual Cluster Choices** box.

5.  (Optional) Click **Choose All** displayed below the **Available StoreVirtual Cluster Choices** box to select and move all the clusters to the **Selected StoreVirtual Cluster Choices** box. 

7. (Optional) Click **Remove All** displayed below the **Selected StoreVirtual Cluster Choices** box or select the cluster(s) and click &larr;to move the clusters back to **Available StoreVirtual Cluster Choices** box. . 

8. Click **Update**.<br>On successful update, the number of clusters mapped to the backend is updated and displays in the Backend Mapping table in the Configure Cloud page.</br>
	<a href="javascript:window.open('/content/documentation/media/undercloud-storevirtual-add-backendoption1.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Expand Backend Page with Update Option (opens in a new window)</a>

### Shrink backend<a name="shrink-backend"></a>

Shrinking removes the clusters from the backend which are allocated to your cloud. To reduce the backend, do the following:

1. In the Configure Cloud page, click **StoreVirtual Backends** Tab to activate it.<br> The page displays a list of backends.</br>

2. Click **More** drop-down list against the Volume Backend for which you want to reduce the cluster(s) and select **Shrink Backend**.<br> Configure StoreVirtual Backend page is displayed.

	<a href="javascript:window.open('/content/documentation/media/undercloud-storevirtual-shrink-backend.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Shrink Backend Option (opens in a new window)</a>

3.  From the **Existing StoreVirtual Clusters** box, select the cluster(s).

4.  Click &rarr; to move the cluster(s)to the **Removed StoreVirtual Clusters** box.

4. (Optional) Click **Remove All** displayed below the **Existing StoreVirtual Cluster(s)** box to move all the cluster(s) to **Removed StoreVirtual Clusters** box.


5. (Optional) Click **Select All** displayed below the **Removed StoreVirtual Clusters** box or select the cluster(s) and click &larr;to move the cluster(s) back to **Existing StoreVirtual Clusters** box.

6. Click **Update**.<br>On successful update, the number of clusters mapped to the backend is updated and displays in the Backend Mapping table in the Configure Cloud page.</br>

	<a href="javascript:window.open('/content/documentation/media/undercloud-storevirtual-shrink-backend1.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Shrink Backend Page with Update Option (opens in a new window)</a>

###Delete backend<a name="delete-backend"></a>

**Note**: Before you delete a backend cluster, detach or migrate the volumes from this cluster, as this backend will not be available once it is deleted.

1. In the Configure Cloud page, click **StoreVirtual Backends** Tab to activate it.<br> The page displays a list of backends.</br>

2. Click **More** drop-down list against the Volume Backend which you want to delete and select **Delete volume backend**.<br> A confirmation dialog box is displayed.

3. Click **Delete volume backend** to delete or **Cancel** to cancel the process.


### Generate configuration<a name="generate-config"></a>
Download the Cinder configuration relevant to the HP StoreVirtual for your cloud once you have created the backend. This configuration file is necessary for backup, restore, and update operations.

To generate a configuration file, do the following:

1. In the Configure Cloud page, click **StoreVirtual Backends** Tab to activate it.<br> The page displays a list of backends.</br>

	<a href="javascript:window.open('/content/documentation/media/undercloud-storevirtual-generate-config.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">Generate Configuration Option (opens in a new window)</a>

2. Click **Generate Config** displayed at the top of the page to display Download StoreVirtual Config page.<br> The configuration file downloads automatically. 


3. (Optional) Click **Download StoreVirtual Config** link to download the file if the file does not automatically download .<br> A dialog box is displayed.</br>

4. Click **OK** to download and save the file.<br>Once you download the configuration file, you can proceed to update the Overcloud configuration.


### Update Overcloud<a name="update-overcloud"></a>

To update your Overcloud with the changes, do the following:

1. SSH to the Seed as root from KVM host.

		ssh root@ <IP address> 

2. View the list of files.

		ls
		
2. Copy the Overcloud template configuration file to `/root/overcloud-config.json` if `/root/overcloud-config.json` is absent.
  
	    cp /root/tripleo/tripleo-incubator/scripts/ee-config.json /root/overcloud-config.json

4. Edit and update the `/root/overcloud-config.json` and add the JSON snippet obtained from [generating the configuration file](#generate-config).Ensure the JSON file format is complete. A sample of the file is given below:
 

		{
		  "cloud_type": "KVM",
		  "compute_scale": 1,
		  "vsa_scale": 0,
		  "vsa_ao_scale": 0,
		  "so_swift_storage_scale": 0,
		  "so_swift_proxy_scale": 0,
		  "bridge_interface": "eth0",
		  "ntp": {
		    "overcloud_server": "",
		    "undercloud_server": ""
		  },
		  "vsa": {
		    "DEFAULT": {
		      "enabled_backends": [
		        "cluster_a6487f02-447e-11e4-a128-80c16e21d1f0"
		      ]
		    },
		    "cluster_a6487f02-447e-11e4-a128-80c16e21d1f0": {
		      "hplefthand_iscsi_chap_enabled": "true",
		      "hplefthand_password": "password",
		      "hplefthand_clustername": "cluster1",
		      "volume_backend_name": "LHN_backend",
		      "volume_driver": "cinder.volume.drivers.san.hp.hp_lefthand_iscsi.HPLeftHandISCSIDriver",
		      "hplefthand_api_url": "https://192.0.2.40:8081/lhos",
		      "hplefthand_debug": "false",
		      "hplefthand_username": "test"
		    }

5. Apply the configuration.

        source /root/tripleo/tripleo-incubator/scripts/hp_ced_load_config.sh /root/overcloud-config.json

6. Launch install script to update the Overcloud.

	    bash -x /root/tripleo/tripleo-incubator/scripts/hp_ced_installer.sh --update-overcloud |& tee update-bv1.log


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*

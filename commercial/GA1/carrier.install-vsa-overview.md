---
layout: default
title: "HP Helion OpenStack&#174; 1.1: Installing HP StoreVirtual VSA Overview"
permalink: /helion/openstack/1.1/install/vsa/overview/
product: commercial.ga
product-version1: HP Helion OpenStack 1.1
role1: Storage Administrator
role2: Storage Architect
authors: Michael B, Paul F

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;">
<a href="/helion/openstack/carrier/install/vsa/">Installing HP StoreVirtual VSA &#9654;</a>
</p> 


# HP Helion OpenStack&#174; 1.1: Installing HP StoreVirtual VSA Overview

This page provides an overview of the instructions on how to deploy HP StoreVirtual VSA Storage Nodes, and their configuration as Cinder backend. 

The following diagram gives an overview of the steps involved in deploying, configuring and integrating StoreVirtual nodes into your cloud. The subsequent sections provide the detailed instructions on integration workflow.


<a href="javascript:window.open('/content/documentation/media/storevirtual-integration.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">HP StoreVirtual VSA Deployment and Configuration Procedure (opens in a new window)</a>


1 - **Install CMC**
     
   [Install CMC](#install-hp-storevirtual-cmc) on the seed node where the seed cloud is running. The CMC binary comes with the HP Helion OpenStack installer and is present in the **Tripleo** directory. 

2 - **Add VSA Baremetal nodes to ironic database**
	
   * Identify the hardware for StoreVirtual deployment and enroll the Baremetal to the ironic database.

   * Log in to the undercloud and source the environment variables(source stackrc).

   * Execute ironic CLI commands from the undercloud to enroll the Baremetal into ironic database.
   
   * [Deploy StoreVirtual storage systems](#deployment-vsa).

3a - **Run update cloud script to provision VSA node**

   * After the [enrollment of the new Baremetal server](#deployment-vsa) in the undercloud, log in to the seed cloud.

   * Update the *overcloud.json* file for StoreVirtual deployment and apply the configuration.
	
   * Execute the update cloud script.

3b - **Discover StoreVirtual in CMC**

   * After updating the cloud, StoreVirtual system is deployed in the new Baremetal server that is enrolled.

   * Create StoreVirtual cluster.

   * The IP address of the StoreVirtual storage system can be retrieved from `/etc/vsa/vsa_network_config.json` file in StoreVirtual node.

   * Launch the CMC and discover the StoreVirtual systems that have been deployed.

3c - **Create VSA cluster**

   * After discovering the StoreVirtual storage systems in CMC, [create the StoreVirtual cluster and management group](#create-cluster) from CMC.

4a - **Launch the undercloud Horizon dashboard**

4b - **Register VSA cluster**

4c - **Create VSA backend**

4d- **Get Cinder configuration for VSA backend**

   * Launch the Horizon Dashboard to [register and create backend for StoreVirtual](/helion/openstack/1.1/undercloud/oc/config/storevirtual/) system.
	
   * After creating the backend, generate the Cinder backend advisory for StoreVirtual.

5a - **Update `overcloud-config.json` file with cinder configuration**

   With the advise generated from the above steps, update the overcloud-config.json file in the seed cloud.

5b - **Run update cloud script to update cinder.conf**

   * The cinder.conf in the overcloud should be updated after updating the overcloud-config.json file in the seed cloud.

   * Execute [update cloud script](/helion/openstack/1.1/undercloud/oc/config/storevirtual/) from seed cloud. -->

## Next Step {#next-steps}

[Installing HP StoreVirtual VSA](/helion/openstack/carrier/install/vsa/)

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----


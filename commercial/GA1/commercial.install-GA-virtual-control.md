---
layout: default
title: "HP Helion OpenStack&#174;: DNSaaS Installation and Configuration"
permalink: /helion/openstack/install/hybrid/
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
<p style="font-size: small;"> <a href="/helion/openstack/install/ovsvapp/">&#9664; PREV</a> | <a href="/helion/openstack/install-overview/">&#9650; UP</a> | <a href="/helion/openstack/related-links/">NEXT &#9654;</a> </p>
-->
# HP Helion OpenStack&#174;: DNSaaS Installation and Configuration

In our 1.0.1 patch release, we’ve added a new deployment option that will allow a user to deploy various nodes of the Control Plane as Virtual Machines instead of Bare Metal Machines, while still allowing user to add Compute Nodes or Storage Nodes as Bare Metal. This is referred to as “Hybrid Control Plane deployment” and is being released in the 1.0.1 as an experimental feature only suitable for Proof Of Concept situations.


Installation

1. Deploy the SEED VM with HP_VM_MODE=y

		# HP_VM_MODE=y bash -x /myStore/myWork/tripleo/tripleo-incubator/scripts/hp_ced_host_manager.sh --create-seed

2. Login to the SEED VM and deploy the undercloud only

		# bash -x /root/tripleo/tripleo-incubator/scripts/hp_ced_installer.sh --skip-overcloud --skip-demo

3. On successful installation of the underlcoud stack & its configuration, login to the undercloud and add the physical nodes for nova-compute (OC)

		root@hLinux:~# ssh -l heat-admin 192.0.2.2

		sudo -i
		undercloud-controller-xyz# ironic node-create -d pxe_ipmitool -p cpus=X -p memory_mb=Y -p local_gb=Z -p cpu_arch=amd64 -i ipmi_address=x.y.z.a -i ipmi_username=admin -i ipmi_password=xyz
		undercloud-controller-xyz# ironce create-port -a $MAC -n $NODE_ID
		undercloud-controller-xyz#
		undercloud-controller-xyz# nova flavor-create <flavor_name> --ephemeral $DSK_SIZE auto $MEM $ROOT_DSK $CPU
		undercloud-controller-xyz# nova flavor-key <flavor_name> set "cpu_arch"=amd64 "baremetal:deploy_kernel_id"=<kernel_id> "barmetal:deploy_ramdisk_id"=<ramdisk_id>
		undercloud-controller-xyz#

4. Edit nova-compute-instance.yaml and modify the Default flavor

		root@hLinux:~# vi tripleo/tripleo-heat-templates/nova-compute-instance.yaml
		>>>Snippet
			OvercloudComputeFlavor:
			Description: Use this flavor
			Type: String
			Default: <flavor_name>
		<<<<<

5. Edit overcloud-source.yaml and modify the compute flavor:

		root@hLinux:~# vi tripleo/tripleo-heat-templates/overcloud-source.yaml
		>>>>> Snippet
			OvercloudComputeFlavor:
			Default: <flavor_name>
			Description: Flavor for compute nodes to request when deploying.
			Type: String
		<<<<<

	**Note:** Replace <flavor_name> with the flavor created in Step 3

6. Complete the installation 

		root@hLinux:~# bash -x /root/tripleo/tripleo-incubator/scripts/hp_ced_installer.sh --skip-seed --skip-undercloud

<!-- This code block is not yet verified.
	TBD: There is another way of passing the parameters to stack-create... via hp_ced_undercloud.

		ENV_JSON=$(jq '.parameters = {
		"OvercloudComputeFlavor": "'"${flavor_name}"'"
		}
-->

**Important:** If in excess of physical servers, there is a possibility that another component along with Nova-compute will also be installed on physical servers. This is because of best-fit along with least used resource.

## Alternative Solution

ComputeCapabilitiesFilter enabled us to overcome the above limitation. This is one of the approaches that we can follow. In this approach, we provide key:value pairs for every node.and register them in Ironic in the undercloud only. Likewise, the default flavor is update with the same key:value pair that is used for VMs and a different flavor is created for compute using the physical server key:value pair. The steps followed in this approach are:

1. Deploy the SEED VM with HP_VM_MODE=y

		HP_VM_MODE=y bash -x /myStore/myWork/tripleo/tripleo-incubator/scripts/hp_ced_host_manager.sh --create-seed

2. Login to the SEED VM

3. Deploy the undercloud only

		bash -x /root/tripleo/tripleo-incubator/scripts/hp_ced_installer.sh --skip-overcloud --skip-demo

4. On successful installation of the undercloud stack and its configuration, login to the Undercloud

5. Modify all existing VM nodes registered with ironic

		root@hLinux:~# ssh -l heat-admin 192.0.2.2

		sudo -i
		undercloud-controller-xyz# source stackrc
		undercloud-controller-xyz# ironic node-update $NODE_ID add "properties/capabilities=hw_type:vm,node_type:any"

6. Add the physical nodes for nova-compute (OC) and create the flavor

		undercloud-controller-xyz# ironic node-create -d pxe_ipmitool -p cpus=X -p memory_mb=Y -p local_gb=Z -p cpu_arch=amd64 -i ipmi_address=x.y.z.a -i ipmi_username=admin -i ipmi_password=xyz -p capabilities="hw_type:bm,node_type:compute"
		undercloud-controller-xyz# ironce create-port -a $MAC -n $NODE_ID
		undercloud-controller-xyz#
		undercloud-controller-xyz# nova flavor-create <flavor_name> --ephemeral $DSK_SIZE auto $MEM $ROOT_DSK $CPU
		undercloud-controller-xyz# nova flavor-key <flavor_name> set "cpu_arch"=amd64 "baremetal:deploy_kernel_id"=<kernel_id> "baremetal:deploy_ramdisk_id"=<ramdisk_id> "hw_type"=bm "node_type"=compute
		undercloud-controller-xyz#
		undercloud-controller-xyz# nova flavor-key baremetal set "hw_type"=vm "node_type"=any

7. Modify 'root/tripleo/tripleo-incubator/scripts/hp_ced_overcloud'

		ENV_JSON=$(jq '.parameters = .parameters + {
			"OvercloudBlockStorageFlavor": "'${OvercloudBlockStorageFlavor:-baremetal}'",
			"OvercloudComputeFlavor": "'${OvercloudComputeFlavor:-baremetal}'",
			"OvercloudControlFlavor": "'${OvercloudControlFlavor:-baremetal}'",
			"OvercloudSwiftScaleoutProxyFlavor": "'${OvercloudSwiftScaleoutProxyFlavor:-baremetal}'",
			"OvercloudVsaFlavor": "'${OvercloudVsaFlavor:-baremetal}'"
		}' <<< $ENV_JSON)

8. Now export OvercloudComputeFlavor=<flavor_name>

9. Complete the installation

	root@hLinux:~# bash -x /root/tripleo/tripleo-incubator/scripts/hp_ced_installer.sh --skip-seed --skip-undercloud













<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*



---
layout: default
title: "HP Helion OpenStack&#174; Deploy Scale-out Swift Node"
permalink: /helion/openstack/services/swift/deployment-scale-out/
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
<p style="font-size: small;"> <a href=" /helion/openstack/services/object/overview/scale-out-swift/">&#9664; PREV</a> | <a href="/helion/openstack/services/overview/">&#9650; UP</a> | <a href=" /helion/openstack/services/object/swift/expand-cluster//"> NEXT &#9654</a> </p>
-->

# HP Helion OpenStack&#174;: Deploying Additional Scale-out Swift Nodes

The scale-out object storage is realized by defining a new storage policy - storage-policy:1. Object-1 ring is associated with storage-policy:1. This ring is used to store end user data. Once the storage-policy:1 is created, it is the default policy and all of the containers would be on this policy unless otherwise specified. We recommend you to use at least **two** nodes to implement storage-policy:1. Also, you can extend the object storage by adding one or more nodes to object-ring:1 as per your requirement.

Perform the following steps to deploy scale-out object-ring:1 

1. [Prerequisite](#preq)
2. [Define the attributes of Object Ring-1](#define-object-ring:1)
2. [Prepare the undercloud to manage Swift Clusters](#prepare-undercloudswift)
3. [Deploy the Scale-out Object Nodes](#deploying-scale-out-Swift-object-nodes)
4. [Verify the Deployed Nodes](#verifying-deployed-swift-nodes)
5. [Prepare the Disks on the Deployed Nodes](#preparing-disks-on-Swift-nodes)
6. [Create a New Scale-out Object Ring](#creating-scale-out-object-ring)
7. [Copy the New Ring(s) to All Nodes](#copying-the-rings-to-all-Swift-nodes)
8. [Update the Storage Policy](#update-storage-scaleout-swift) 

##Prerequisites {#preq}

A HP Helion OpenStack&#174; cloud must be deployed. Functional Swift starter nodes are created as an integral part of cloud deployment.

##Define the Ring Attributes of Object Ring-1 {#define-object-ring:1}
**Caution**:Plan the following ring attributes before deployment of object-ring:1 because many attributes, such as **part power** and **replica count**, cannot be changed after the ring has been deployed.

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
	<th>Attributes</th>
	<th><center>Definition</center></th>
    <th><center>Recommendation</center></th>
</tr>
<tr style="background-color: white; color: black;">
	<td><b>Zone</b></td>
	<td>Defines single point of failure within your cluster. </td>
    <td>It is recommended to use a single zone with multiple servers. Having multiple servers (at least three) ensures that the replicas are distributed across servers, not all on one.</td>
</tr>
<tr style="background-color: white; color: black;">
	<td><b>Replica Count</b></td>
	<td>Defines the number of copies of objects created.</td>
    <td>The recommended value is 3.</td>
</tr>
<tr style="background-color: white; color: black;">
	<td><b>Part Power</b></td>
	<td>Defines the storage cluster capacity. Set the <i>partition power</i> value based on the total amount of storage you expect your entire ring to use.</td>
    <td>  The parameter is an exponent: 2^X. Assuming that the average available drive capacity is 1-3 TB, the recommended value is 20. </td>
</tr>
<tr style="background-color: white; color: black;">
	<td><b>Min part hour</b></td>
	<td>This should be set to however long a full replication/update cycle takes. No partition is moved twice during the specified amount of time.</td>
    <td> The recommended value is 24 hours. Note that this restriction is ignored in the case of device failure when there is no option other than reassignment.</td>
</tr>
</table>

##Prepare the undercloud to manage Swift clusters {#prepare-undercloudswift}

Using the ***ringos*** utility you can add the [provisioned nodes](/helion/openstack/services/swift/provision-nodes/) to the Swift cluster. 

1. Enable SSH from the undercloud to the overcloud node by copying the SSH keys from the seed to the undercloud. 

2. Log in to the seed. 

		# ssh root@<seed IP address>
 
3. Copy the SSH key from the seed cloud to undercloud.

		# scp ~/.ssh/id_rsa heat-admin@<\undercloud IP address>:/home/heat-admin

4. Log in to the undercloud.

		# ssh heat-admin@<undercloud IP address>
		# sudo -i
		# mv ~heat-admin/id_rsa ~/.ssh/ 


##Deploy the Scale-out Object Nodes {#deploying-scale-out-Swift-object-nodes}

Before starting the deployment of scale-out object nodes you must configure the `kvm-default.json` file. If `kvm-default.json` has already been created during installation, edit the file instead.

1. Log in to the seed. 

		# ssh root@<seed IP address>

		
2. Update the `so_swift_storage_scale` parameter in the `/root/tripleo/configs/kvm-default.json` file according to your storage needs.
 
 	 For more details, refer [Provisioning Swift node(s)](/helion/openstack/services/swift/provision-nodes/)

3. Enter the following command to source the `kvm-default.json`  for the new values.
    
    	# source /root/tripleo/tripleo-incubator/scripts/hp_ced_load_config.sh /root/tripleo/configs/kvm-default.json

4. Source the environment variables file created during initial installation. 

		# source /root/kvm-custom-ips.json
		
5. Run the installer script to update the cloud.

    	# bash -x tripleo/tripleo-incubator/scripts/hp_ced_installer.sh --update-overcloud |& tee update_cloud.log

## Verify the Deployed Nodes {#verifying-deployed-Swift-nodes}

Perform the following steps to verify the deployment of Swift nodes:

1. Log in to the undercloud from the seed.
    
		# ssh heat-admin@<undercloud IP address> 
		# sudo -i

2. Source `stackrc` using the following command:

    	 # source stackrc 
 
3. List the available scale-out Swift nodes. 

		# ringos list-swift-nodes -t object

	The following sample displays scale-out Swift nodes: 

		+--------------+
		| object-nodes |
		+--------------+
		| 192.0.2.29   |
		| 192.0.2.30   |
		+--------------+

4. List the disks available on each node.

		# ringos list-disks -n <object nodes IP address> 
 
	The following sample displays the disk available on the node **192.0.2.29**.
	
		+----------+------------+
		| disk     | size       |
		+----------+------------+
		| /dev/sda | 1073741824 |
		|          |            |
		| /dev/sdb | 1073741824 |
		+----------+------------+


5. Repeat the verification process for all of the object node(s).

##Prepare the Disks on the Deployed Nodes {#preparing-disks-on-swift-nodes}

Once Swift nodes are deployed, the next step is to format and mount the required disks so they can be added to the Swift cluster. 

To format a given disk:

	# ringos format-disks -n <object node IP address> -d all


The following sample displays the output of formatted disk of **192.0.2.29**.

		+----------+-----------+---------+---------------------------------+-------------+------------+
		| disk     | formatted | mounted | mount_point                     | label       | size       |
		+----------+-----------+---------+---------------------------------+-------------+------------+
		| /dev/sda | y         | y       | /mnt/state/srv/node/a1410063335 | a1410063335 | 1073741824 |
		| /dev/sdb | y         | y       | /mnt/state/srv/node/b1410063336 | b1410063336 | 1073741824 |               
		+----------+-----------+---------+---------------------------------+-------------+------------+

**Note**: You can also format disks individually by using `-d <device-name>`.
For more details, see the [ringos](/helion/openstack/GA1/services/object/pyringos/) manual.

Repeat the above steps for all of the object nodes.

## Create a New Scale-out Object Ring {#creating-scale-out-object-ring}

Once the disk is formatted you can create a scale-out object ring. This ring is created for the scale-out Swift which is an extension of the Starter Swift nodes which are installed by default during HP Helion CloudStack&reg; cloud deployment.

1. Create a directory named `ring-building`. 

		# mkdir -p /root/ring-building
		# cd /root/ring-building
 

2. Create a ring with the attribute specified in [Defining ring attributes of object-ring:1](#define-object-ring:1). 

		# ringos create-ring -f /root/ring-building/object-1.builder -p <part_power> -r <replicas> -m <min_part_hours>


	The following sample displays the creation of ring by adding scale-out Swift node to a zone with partition power =10, replicas =3, min&#095;part&#095;hours =24

    	# ringos create-ring -f /root/ring-building/object-1.builder -p 10 -r 3 -m 24
    	created ring /root/ring-building/object-1.builder


3. Add the disk to the ring. 

    	# ringos add-disk-to-ring -f /root/ring-building/object-1.builder -i  <object node IP address> -p  <port> -d <disk label> -w <weight> -r <region> -z <zone>

	**Note:** Use labels and disks obtained in output of section [Preparing disks on Swift nodes](#preparing-disks-on-swift-nodes).

	The following sample displays the addition of disk to **192.0.2.29** and its output.

    	# ringos add-disk-to-ring -f /root/ring-building/object-1.builder -i 192.0.2.29 -p 6000 -d a1410063335 -w 100 -r 1 -z 1
    	Added disk 192.0.2.29:a1410063335 to ring

4. Verify the content of `object-1.builder` file to ensure that it meets your required configuration.

	`# ringos view-ring -f /root/ring-building/object-1.builder`
	
	The following sample displays the content of `object-1.builder` file:

	    object-1.builder, build version 9
    	1024 partitions, 3.000000 replicas, 1 regions, 3 zones, 9 devices, 100.00 balance
    	The minimum number of hours before a partition can be reassigned is 1
    	Devices:id  region  zone  ip address  port  replication ip  replication port  name weight partitions balance meta
    	 0   1 1  192.0.2.29  6000  192.0.2.29  6000 a1410063335 100.00  0 -100.00
    	 1   1 1  192.0.2.29  6000  192.0.2.29  6000 b1410063336 100.00  0 -100.00

5. Re-balance the ring. 

    	# ringos rebalance-ring -f /root/ring-building/object-1.builder

	This will generate an **object-1.ring.gz** file.

 	The following sample displays the output of re-balancing the ring:

    	Rebalanced ring /root/ring-building/object-1.builder
 
6. Verify the content `object-1.builder` file after re-balancing the ring.

    	# ringos view-ring -f /root/ring-building/object-1.builder


##Copy the New Ring(s) to All Nodes {#copying-the-rings-to-all-Swift-nodes}

1. List all the rings from the starter Swift nodes. 

		# ringos list-swift-nodes -t starter

	The following sample displays the list of Starter Swift nodes.

		+---------------+
		| starter-nodes |
		+---------------+
		| 192.0.2.22    |
		| 192.0.2.24    |
		+---------------+

	
2. Get all the rings and builder files from either of the starter nodes.

		rsync -qzp --rsync-path="sudo rsync" heat-admin@<starter Swift nodes IP address>:/etc/swift/object.ring.gz /root/ring-building/
		rsync -qzp --rsync-path="sudo rsync" heat-admin@<starter Swift nodes IP address>:/etc/swift/account.ring.gz /root/ring-building/
		rsync -qzp --rsync-path="sudo rsync" heat-admin@<starter Swift nodes IP address>:/etc/swift/container.ring.gz /root/ring-building/
		

	The following sample displays all the rings and builder files from **19.0.2.22**

		rsync -qzp --rsync-path="sudo rsync" heat-admin@<19.0.2.22>:/etc/swift/object.ring.gz /root/ring-building/
		rsync -qzp --rsync-path="sudo rsync" heat-admin@<19.0.2.22>:/etc/swift/account.ring.gz /root/ring-building/
		rsync -qzp --rsync-path="sudo rsync" heat-admin@<19.0.2.22>:/etc/swift/container.ring.gz /root/ring-building/
	
	**Note**: The ring files are identical on both the starter swift nodes. You can copy **.gz** files  in either of the starter nodes as they are identical.


3. List all the Swift nodes. 

		# ringos list-swift-nodes -t  all
 
4. Copy account, container, object-0, and generated `object-1.ring.gz` files to all Swift nodes and press **yes** when asked to authenticate node. 

		# ringos copy-ring -s /root/ring-building/\*.ring.gz -n <Swift node IP address>

In the following example account, container, object-0, and generated `object-1.ring.gz` are copied to all the nodes:

	# ringos copy-ring -s /root/ring-building/\*.ring.gz -n 192.0.2.22
	# ringos copy-ring -s /root/ring-building/\*.ring.gz -n 192.0.2.29
		
	The authenticity of host '192.0.2.29 (192.0.2.29)' can't be established.
	ECDSA key fingerprint is 8a:eb:b7:66:3b:5f:fa:d6:d1:49:80:1a:a7:90:79:20.
	Are you sure you want to continue connecting (yes/no)? yes
	Copied ring /root/ring-building/object-1.ring.gz onto 192.0.2.29

<!--**Note**: The system may escape the authentication of node sometimes. --->

##Update the Storage Policy {#update-storage-scaleout-swift}

1. Log in to seed. 

		# ssh root@<seed IP address>

2. Edit ` /root/tripleo/hp_passthrough/overcloud_swift_conf.json` to replace the default values with the ones listed:


		{"swift":
		  {"config":
		    [ 
		      {"section": "storage-policy:0",
		       "values":
		        [ 
		          {"option": "name",
		           "value": "Policy-0"
		          },
		          {"option": "default",
		           "value": "no"
		          }
		        ]
		      },
		      {"section": "storage-policy:1",
		       "values":
		        [
		          {"option": "name",
		           "value": "ScaleOut"
		          },
		          {"option": "default",
		           "value": "yes"
		          }
		        ]
		      }
		    ]
		  }
		}

3. Source the `overcloud-config.json` file.
    
    	# source /root/tripleo/tripleo-incubator/scripts/hp_ced_load_config.sh /root/overcloud-config.json


4. Run the installer script to update the storage policies across the cloud.

    	# bash -x tripleo/tripleo-incubator/scripts/hp_ced_installer.sh --update-overcloud |& tee update_cloud.log

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*

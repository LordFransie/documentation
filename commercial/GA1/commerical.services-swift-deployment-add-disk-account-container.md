---
layout: default
title: "HP Helion OpenStack&#174; Add Disk to Account and Container Ring"
permalink: /helion/openstack/ga/services/swift/deployment/add-disk-account-container/
product: commercial.ga

---
<!--UNDER REVISION-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!---
<p style="font-size: small;"> <a href=" /helion/openstack/ga/services/object/swift/expand-cluster/">&#9664; PREV</a> | <a href=" /helion/openstack/ga/services/object/swift/expand-cluster/">&#9650; UP</a> | <a href="/helion/openstack/ga/services/swift/deployment/add-disk-scale-out/"> NEXT &#9654</a> </p> --->


#HP Helion OpenStack&#174; Adding Disks to Account or Container Rings

Proxy nodes store account and container objects. When new disks are added to a proxy node, the new disks expand the storage capacity of the account and container rings. 

1. [Prerequisite](#prer)
2. [Add Disks to an Account or Container Ring](#adding-swift-disks-to-a-ring)

##Prerequisite {#prer}

* HP Helion OpenStack&#174; cloud is successfully deployed.<br>*(Starter Swift nodes are functional by default as they are part of cloud deployment.)*
* Scale-out object-ring:1 has been deployed.
* At least one Scale-out Proxy node has been deployed.
* All of the rings generated **must** be preserved, preferably at more than one location. Swift requires these rings to be consistent across all nodes. 
* Make a backup of the rings before any operation.

##Add Disks to an Account or Container Ring {#adding-swift-disks-to-a-ring}

Perform the following steps to add Swift disk to a ring:

1. Log in to Undercloud from Seed. 

		# ssh heat-admin@<Undercloud IP address> 
		# sudo -i

2. Change the directory to ring builder.

		# cd /root/ring-building


3. List the scale-out Proxy node.

		# ringos list-swift-nodes -t proxy

	The following sample displays the Proxy nodes:

			+---------------+
			| proxy-nodes   |
			+---------------+
			| 192.0.2.22    |
			+---------------+

4. List the disks on the Proxy node.

		# ringos list-disks -n <Proxy node IP address> 

	The following sample displays the lists of disk available on the Proxy node **192.0.2.22**. 

				+----------+------------+
				| disk     | size       |
				+----------+------------+
				| /dev/sdb | 1073741824 |
				|          |            |
				| /dev/sdc | 1073741824 |
				|          |            |
				+----------+------------+
	
5. Format the target disk.

		# ringos format-disks -n <Proxy node IP address>  -d <disk>

	The following sample displays the output of formatted disk of **192.0.2.22**.

		+----------+-----------+---------+---------------------------------+-------------+------------+
		| disk     | formatted | mounted | mount_point                     | label       | size       |
		+----------+-----------+---------+---------------------------------+-------------+------------+
		| /dev/sdb | y         | y       | /mnt/state/srv/node/b1410063336 | b1410063336 | 1073741824 |
		+----------+-----------+---------+---------------------------------+-------------+------------+


	**Note**: You can format all the disks with a single command (-d --all).

6. List the file in the ring building directory. Identify `account.builder` and `container.builder` files.

7. Add the formatted disk to account and container ring.

		# ringos add-disk-to-ring -f /root/ring-building/account.builder -i <Proxy nodes IP address> -p <port> -d <disk label> -w <weight> -r <region> -z <zone>
		# ringos add-disk-to-ring -f /root/ring-building/container.builder -i <Proxy nodes IP address> -p <port> -d <disk label> -w <weight> -r <region> -z <zone>

	**Recommendation**: 
                
	Add drives gradually using a weighted approach to avoid degraded performance of Swift cluster. The weight will gradually increase by 25% until it becomes 100%. The initial weight is 25.


8. Re-balance both account and container ring(s).

    	# ringos rebalance-ring -f /root/ring-building/account.builder
    	# ringos rebalance-ring -f /root/ring-building/container.builder	

9. List all the Swift nodes. 
    
    	# ringos list-swift-nodes -t all

10. Copy `account.ring.gz`  and  `container.ring.gz` files to all the nodes.

    	# ringos copy-ring -s /root/ring-building/account.ring.gz -n <Swift nodes IP address>
    	# ringos copy-ring -s /root/ring-building/container.ring.gz -n <Swift nodes IP address>


11. Set the weight of the disks using the following command:
    
    	# ringos set-weight -f /root/ring-building/account.builder -s <disk id> -w <weight>
    	# ringos set-weight -f /root/ring-building/container.builder -s <disk id> -w <weight>
 
12. Repeat steps from **8-11** increasing the weight by 25 each time; set the weight to 50, 75, and finally 100 (w= 50, 75, 100) .

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
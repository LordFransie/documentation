---
layout: default
title: "HP Helion OpenStack&#174; Add Disk to Starter Object Ring"
permalink: /helion/openstack/services/swift/deployment/add-disk-starter/
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
<p style="font-size: small;"> <a href=" /helion/openstack/services/object/swift/expand-cluster/">&#9664; PREV</a> | <a href="/helion/openstack/services/object/swift/expand-cluster/">&#9650; UP</a> | <a href="/helion/openstack/services/swift/deployment/add-proxy-node/"> NEXT &#9654</a> </p>-->


#HP Helion OpenStack&#174;: Add a Disk to Starter Object Ring

Perform the following procedure to add disk to a starter object ring. 

1. [Prerequisite](#prer)
2. [Add disks to a Starter Object Ring](#adding-Swift-disks-to-a-ring)

##Prerequisite {#prer}

* HP Helion OpenStack&#174; cloud is successfully deployed.<br>*(Starter Swift nodes are functional by default as they are part of cloud deployment.)*
*  All of the rings generated **must** be preserved, preferably at more than one location. Swift needs these rings to be consistent across all nodes.
* Make a backup of the rings before any operation.

## Add disks to a Starter Object Ring {#adding-Swift-disks-to-a-ring}

Perform the following steps to add Swift disk to a ring:

1. Log in to the undercloud from seed. 

		# ssh heat-admin@<undercloud IP address> 
		# sudo -i

2. Change the directory to ring builder.

		# cd /root/ring-building

3. List the starter Swift nodes.

		# ringos list-swift-nodes -t starter

4. List the disks on the starter nodes.

		# ringos list-disks -n <starter Swift nodes IP address> 

5. Format the given disk.

		# ringos format-disks -n <starter Swift nodes IP address> -d <disk>

	**Note**: You can format all the disks with the single command (-d --all).


6. List the file in ring directory and identify the `object.builder` file for object.

7. Add the formatted disk to object ring.

		# ringos add-disk-to-ring -f /root/ring-building/object.builder -i <Starter Swift nodes IP address> -p <port> -d <disk label> -w <weight> -r <region> -z <zone>

	**Note**: Choose the zone and region information appropriately.

	**Recommendation**: 
              
	* Add drives gradually using a weighted approach to avoid degraded performance of Swift cluster. The weight will gradually increase by 25% until it becomes 100%. The initial weight is 25.

8. Re-balance the ring.

		# ringos rebalance-ring -f /root/ring-building/object.builder
	
	**Note**: You must wait for the time specified by `min_part_hours` before another re-balance succeeds.	
	
9. List all the Swift nodes. 

		# ringos list-swift-nodes -t all
		
10. Copy the object file to all the nodes.
    
    	# ringos copy-ring -s /root/ring-building/object.ring.gz -n <Swift nodes IP address>


11. Set the weight of the disks using the following command:


    	# ringos set-weight -f /root/ring-building/object.builder -s <disk id> -w <weight>

 
12. Repeat steps from **8-11** gradually increasing the disk weight by 25: set the weight to 50, 75, and finally 100 (w= 50, 75, 100) .

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
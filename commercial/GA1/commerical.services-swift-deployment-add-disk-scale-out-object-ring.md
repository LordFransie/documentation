---
layout: default
title: "HP Helion OpenStack&#174; Add Disk to scale-out Object Ring"
permalink: /helion/openstack/services/swift/deployment/add-disk-scale-out/
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
<p style="font-size: small;"> <a href="/helion/openstack/services/object/swift/expand-cluster/">&#9664; PREV</a> | <a href=" /helion/openstack/services/object/swift/expand-cluster/">&#9650; UP</a> | <a href="/helion/openstack/services/swift/deployment/add-disk-starter/"> NEXT &#9654</a> </p> --->


#HP Helion OpenStack&#174;: Add a Disk to a Scale-out Object Ring

Perform the following procedure to add a disk to a scale-out object ring. 

1. [Prerequisite](#prer)
2. [Add disks to the ring](#adding-Swift-disks-to-a-ring)

##Prerequisite {#prer}

* HP Helion OpenStack&#174; cloud is successfully deployed.<br>*(Starter Swift nodes are functional by default as they are part of cloud deployment.)*
* Scale-out object-ring:1 has been deployed.
*  All of the rings generated **must** be preserved, preferably at more than one location. Swift needs these rings to be consistent across all nodes.
* Make a backup of the rings before any operation.

##Add Disks to a Scale-out Ring {#adding-Swift-disks-to-a-ring}

Perform the following steps to add disk to a Swift ring:


1. Log in to the undercloud from seed. 

		# ssh heat-admin@<Undercloud IP address> 
		# sudo -i

2. Change the directory to ring builder.

		# cd /root/ring-building

3. List the disks on a node.

		# ringos list-disks -n <Object nodes IP address> 

4. Format a given disk.

		# ringos format-disks -n <Object nodes IP address> -d <disk>


	**Note**: You can format all the disks with a single command (-d --all).

5. List the files in the ring building directory and identify the`object-1.builder` file.

6. Add a formatted disk to object-1 ring.

		# ringos add-disk-to-ring -f /root/ring-building/object-1.builder -i <Object nodes IP address> -p <port> -d <disk label> -w <weight> -r <region> -z <zone>
	
	**Recommendation**: 
	Add drives gradually using a weighted approach to avoid degraded performance of the Swift cluster. The weight will gradually increase by 25% until it reaches 100%. The initial weight is 25.

7. Re-balance the object-1 ring.
    
    	# ringos rebalance-ring -f /root/ring-building/object-1.builder
	
	**Note**: You must wait for the time specified by `min_part_hours` before another re-balance succeeds.	

8. List all the Swift nodes. 


    	# ringos list-swift-nodes -t all

			
9. Copy `object-1.ring.gz` file to all the nodes.
    
    	# ringos copy-ring -s /root/ring-building/object-1.ring.gz -n <Swift nodes IP address>
	

10. Set the weight of the disks using the following command:

    	# ringos set-weight -f /root/ring-building/object-1.builder -s <disk-id> -w <weight>

 
11. Repeat steps from **7-10** increasing the weight by 25 each time; set the weight to 50, 75, and finally 100 (w= 50, 75, 100) .


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*

 

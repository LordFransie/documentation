---
layout: default
title: "HP Helion OpenStack&#174; Object Operations Service Overview"
permalink: /helion/openstack/services/swift/deployment/add-disk-object-node/
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
<p style="font-size: small;"> <a href=" /helion/openstack/services/object/swift/expand-cluster/">&#9664; PREV</a> | <a href=" /helion/openstack/services/object/swift/expand-cluster/">&#9650; UP</a> | <a href=" /helion/openstack/services/object/swift/Monitor-cluster/"> NEXT &#9654</a> </p>
--->

#HP Helion OpenStack&#174;: Add New Scale-out Object Node

Perform the following procedure to add new scale-out object node. 


1. [Prerequisites](#preq)
2. [Deploying new object nodes](#deploy-new-object-node)
3. [Adding node and disks to object-ring:1](#add-disk-node)


##Prerequisite {#preq}

* HP Helion OpenStack&#174; cloud is successfully deployed. *(Starter Swift nodes are functional by default as they are part of cloud deployment)*
* Scale-out object-ring:1 is deployed.

##Deploying new object nodes {#deploy-new-object-node}

1. Perform the steps mentioned in [Provision Swift Node(s)]( /helion/openstack/services/swift/provision-nodes/) to deploy a new node.


##Format and Mount the Disks
Once the Swift nodes are deployed, the required disks must be formatted and mounted them before adding them to the Swift cluster. 

1. Log in to the undercloud from the seed.
    
		# ssh heat-admin@<Undercloud IP address> 
		# sudo -i

2. Change the working directory to the ring building directory.
 
		# cd /root/ring-building

3. List the available scale-out Swift nodes and identify the newly-created node(s). 

		# ringos list-swift-nodes -t object

4. List the disks available on the node.

		# ringos list-disks -n <Object nodes IP address> 
 
5. Format the target disk.

		# ringos format-disks -n <Object nodes IP address> -d <disk>

	**Note**: You can format all the disks with a single command: `-d --all` but be very careful!
## Adding nodes and disks to object-ring:1 {#add-disk-node} 

1.  List the files in the ring building directory and identify the *object-1.builder* file.

7. Add the formatted disk(s) to the object-1 ring.

		# ringos add-disk-to-ring -f /root/ring-building/object-1.builder -i <Object nodes IP address> -p <port> -d <disk label> -w <weight> -r <region> -z <zone>

	**Recommendation**: Add drives gradually using a weighted approach to avoid degraded performance of the Swift cluster. The weight will gradually increase by 25% until it reaches 100%. The initial weight is 25.

8. Re-balance the object-1 ring.
    
    	# ringos rebalance-ring -f /root/ring-building/object-1.builder
	
	**Note**: You must wait for the length of time specified in `min_part_hours` before another re-balance succeeds.	

9. List all the Swift nodes. 

	    # ringos list-swift-nodes -t all
    
			
10. Copy `object-1.ring.gz` file to all the nodes.
    
    	# ringos copy-ring -s /root/ring-building/object-1.ring.gz -n <Swift nodes IP address>
	

11. Set the weight of the disks using the following command:

    	# ringos set-weight -f /root/ring-building/object-1.builder -s <Object node IP address> -w <weight>
 
12. Repeat steps from **3-6** as necessary, increasing the weight by 25 each time. [Change the weight to 50, then 75, and then 100 (w= 50, 75, 100).]

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*

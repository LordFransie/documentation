---
layout: default
title: "HP Helion OpenStack&reg; Verifying your installation"
permalink: /helion/community/verify/
product: community

---
<!--PUBLISHED-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>

<!--
<p style="font-size: small;"> <a href="/helion/community/">&#9664; PREV</a> | <a href="/helion/community/">&#9650; UP</a> | <a href="/helion/community/install-overview/">NEXT &#9654;</a> </p>
-->

# HP Helion OpenStack&reg; Verifying your installation

Once your installation is complete, you should make sure you can connect to your HP Helion OpenStack Community cloud. You can accomplish this in any of the following ways:

* [Connecting to demo VM](#connectvm)

* [Connecting to Horizon console](#connectconsole)

* [Connecting to Monitoring UI](#connectmonitor)

### Connecting to the demo VM ### {#connectvm}

From the seed cloud host, you can connect to the demo VM using the following steps:

1. Export the overcloud passwords:

	`. /root/tripleo/tripleo-overcloud-passwords`

2. Export the overcloud users:

	`TE_DATAFILE=/root/tripleo/ce_env.json . /root/tripleo/tripleo-incubator/overcloudrc-user`

3. Verify you can view the nova instances:

	`nova list`

4. Assign the demo VM IP address to a variable:

	`DEMO_IP=$(nova list | grep " demo " | awk ' { print $13 } ')`

5. Connect to the demo vm:

	`ssh debian@${DEMO_IP}`

	**Note:** It might take a few minutes for the demo vm to become available using ssh after finishing the installation.

### Connecting to the Horizon console ### {#connectconsole}

From the seed cloud host, connect to the overcloud Horizon console.

1. Obtain the passwords for the `demo` from `/root/tripleo/tripleo-overcloud-passwords`.

2. Point your web browser on the seed cloud host to the overcloud Horizon console, be default:

		http://192.0.2.24

	If you did not retrieve the overcloud IP from the end of the install, enter the following command:

		. /root/tripleo/tripleo-undercloud-passwords
		TE_DATAFILE=/root/tripleo/ce_env.json . /root/tripleo/tripleo-incubator/undercloudrc
		OVERCLOUD_IP=$(heat output-show overcloud KeystoneURL | cut -d: -f2 | sed s,/,,g )
		echo $OVERCLOUD_IP

4. Log in as `demo` or `admin` using the corresponding passwords obtained in step 1.

### Connecting to the monitoring interface ### {#connectmonitor}

HP Helion OpenStack Community includes a monitoring interface. You can access this with the following steps:

1. Point your web browser on the seed cloud host to the undercloud monitoring console:

		http://<undercloud IP>/icinga/

	**Example:**

		http://192.0.2.24/icinga

	If you did not retrieve the overcloud IP from the end of the install, enter the following command:

		. /root/stackrc
		UNDERCLOUD_IP=$(nova list | grep "undercloud" | awk ' { print $12 } ' | sed s/ctlplane=// )
		echo $UNDERCLOUD_IP

2. Login as user `icingaadmin` with password `icingaadmin`.


## Next Step

* Review [OpenStack documentation](/helion/community/related-links/) 

* See how to [log in to and use the Horizon dashboard](/helion/openstack/community/dashboard/login/).




 <a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*

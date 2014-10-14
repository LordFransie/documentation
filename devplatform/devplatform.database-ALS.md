---
layout: default-devplatform
title: "Connecting the Database Service with ALS"
permalink: /helion/devplatform/connectdatabase/
product: devplatform

---
<!--UNDER REVISION-->

#Connecting the Database Service with the Application Lifecycle Service
If a more durable or scalable MySQL database service is needed, ensure your ALS cluster is configured to use a database instance or master/slave pair provided by the Database Service. This is an option at cluster create time.

<img src="media/databaseALS.png"/>

##Configuration {#configure} 
Alternatively, if the Database Service was not integrated with the cluster at the time of cluster creation, the administrator of the ALS cluster can switch from the unmanaged MySQL service to the managed Database Service using the following kato commands:

1. Enable the root user on the database instance you want to join to the ALS cluster
2.	SSH to the ALS cluster instances and use the kato admin client. 
3.	Set the endpoint details including hostname, port, root user, and password:
	
		$ kato config set mysql_node mysql/host 10.5.120.101
		$ kato config set mysql_node mysql/port 3306
		$ kato config set mysql_node mysql/user root
		$ kato config set mysql_node mysql/pass CorrectHorseBatteryStaple
1. Increase the timeout settings to make the [*thin*](http://code.macournoyer.com/thin/) mysql\_gateway connect reliably to the database instance. 
2. Run the following commands:

    	$ kato config set mysql_node connection_wait_timeout 100
    	$ kato config set mysql_node keep_alive_interval 60

The way in which you deploy applications does not change between the managed and unmanaged versions of the MySQL service. A developer connects to and interacts with the MySQL database in exactly the same way regardless of which service is used.

The benefits of the unmanaged service include a lighter footprint (fewer virtual machines) and no dependency on the Database Service being configured and available. The managed service provides full lifecycle management and scalability, capabilities not found in the unmanaged service.

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*


 

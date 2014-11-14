---
layout: default-devplatform
title: "HP Helion OpenStack Development Platform Installation"
permalink: /helion/devplatform/install/
product: devplatform

---
<!--PUBLISHED-->

# HP Helion Development Platform Commercial Installation and Configuration NEW

The HP Helion Development Platform currently contains four products: Application Lifecycle Service (ALS), Marketplace Service, Messaging Service and Database Service.

The following topics explain how to install and configure the HP Helion Development Platform.

If you are installing the HP Helion Development Platform Community, see [HP Helion Development Community Installation and Configuration]{

* [Prerequisites](#prerequisites)

* [Installing the HP Helion Development Platform](#installing-the-hp-helion-development-platform)

* [Install the Messaging Service](#install-messaging)

* [Install the Application Lifecycle Service](#install-als)

* [Install the Database Service](#install-database)

* [Install the Marketplace Service](#install-marketplace)

* [Troubleshooting](#troubleshooting)

## Prerequisites<a name="prerequisites"></a>

The HP Helion Development Platform is installed in the overcloud of HP Helion OpenStack Community Edition - Baremetal.  The HP Helion Development Platform has the same prerequisites as HP Helion OpenStack Community Edition - Baremetal.

The system running the installer needs to have Python 2.7. Most modern operating systems include this as part of their base toolkit. This document is geared toward a Linux operating system but this does not preclude the installer from running on other operating systems with some minor modifications to the command-line statements herein.
 
The installer requires the following packages. If they are not found, it will prompt you to install them.

* python-dev 
* libffi-dev 
* libssl-dev 
* python-virtualenv
* python-pip

    
## Installing the HP Helion Development Platform<a name="installing-the-hp-helion-development-platform"></a>

### Downloading and unpacking the installation file

The installation of the HP Helion Development Platform for the HP Helion OpenStack Commercial Edition is provided as a small compressed tar file.  The images for the actual services will be downloaded at the installers request.

You can register and download the package from the following URL:

[HP Helion Development Platform](https://helion.hpwsportal.com/#/Product/%7B%22productId%22%3A%221245%22%7D/Show)

To begin the installation, unpack the tar file:

    # tar -zxvf hp_helion_devplatform_commercial.tar.gz.csu
    
This creates and populates a `dev-platform-installer` directory.

    # cd dev-platform-installer
    
### Preparing to run the installer

If your network uses a proxy, it may be necessary to set the proxy shell variable.

	# export https_proxy=<ip address or url of http proxy> 

Run this command to prepare the installer and ensure prerequisites are met. By default the Username is "admin", the Tenant Name is "admin" and the Region is "regionOne":

    # ./DevelopmentPlatform_Setup.sh -p {admin_user_password} -a {auth_host_ip_address}
    
 Optionally, you can specify the Username, Tenant and Region
    
    # ./DevelopmentPlatform_Setup.sh -p {admin_user_password} -a {auth_host_ip_address} -u {username} -t {tenant_name} -r {region_name}
    
 The install script also has a help feature
 
 	# ./DevelopmentPlatform_Setup.sh -h
 	
After the install command completes, you should see the following output from the command:

Once the installation is complete, you should see the following output:

    2014-06-17 16:53:19.765       INFO Install Complete

## Install the Messaging Service<a name="install-messaging"></a>
This section provides details on installing the Messaging service from the Development Platform.

### Connect to the Download Service

1. Open Horizon and login as the "admin" user. Then click on the **Admin** panel in Horizon and select **Development Platform**. Finally, click **Configure Services**.

2. Click the **Connect** button on the **Configure Services** screen and enter your username and password for the HP Cloud OS Content Delivery Network. Select the Sign-up button if you do not have an account.

### Download and Configure the Messaging Service

1. In the **Configure Services** panel locate the Messaging (Beta) item in the Configure Services table and select **Download Service** and wait for the download to complete.

2. Once the download is complete, click the **Configure Service** button to configure the Messaging Service and wait for the configuration step to complete.

3. Log out from the Horizon dashboard. Log back into the Horizon dashboard as a non-admin user and click on the **Messaging (Beta)** panel under the current Project to begin using the Messaging Service.

## Install the Application Lifecycle Service (ALS)<a name="install-als"></a>
This section provides details on installing the Application Lifecycle service from the Development Platform.

### Prerequisites

For ALS to install dependencies for deployed applications, you must provide ALS with outbound Internet connectivity. This process is documented in Step 7 of ["Starting the seed and building your cloud"](http://docs.hpcloud.com/helion/community/install/#startseed) in the baremetal installation instructions.  If an HTTP Proxy is required for Internet downloads, follow the instructions in the [Administration Guide](http://docs.hpcloud.com/als/v1/admin/server/configuration/#http-proxy).

### Connect to the Download Service

1. Open Horizon and login as the "Admin" user. Then click on the **Admin** panel in Horizon and select **Development Platform**. Finally, click on **Configure Services**.

2. Click the **Connect** button on the **Configure Services** panel and enter your username and password for the HP Cloud OS Content Delivery Network. Select the Sign-up button if you do not have an account.

### Download and Configure the Application Lifecycle Service

1. In the **Configure Services** panel locate the Application Lifecycle Service item in the Configure Services table and select **Download Service** and wait for the download to complete.

2. Once the download is complete, click the **Configure Service** button to configure the Application Lifecycle Service and wait for the configuration step to complete.

3. Log out from the Horizon dashboard. Log back into the Horizon dashboard as a non-admin user and click on the **Application Lifecycle Service** panel under the current Project to being using Application Lifecycle Services.

## Install the Database Service<a name="install-database"></a>
This section provides details on installing the Database Service from the Development Platform.

### Prerequisites

#### Availability Zones

To configure the **Database Service** in a highly available manner, it is necessary to create separate availability zones for the compute hosts in the service. The following steps show how to create three availability zones and assign a compute host to the zone.

1. Connect to an overcloud controller node and execute the following commands to create three availability zones named: "AZ-1", "AZ-2" and "AZ-3". 
	
		nova aggregate-create aggregate-AZ-1 AZ-1
		nova aggregate-create aggregate-AZ-2 AZ-2
		nova aggregate-create aggregate-AZ-3 AZ-3
		
 2. Validate that the availability zones were correctly created by issuing the following command.
 	
 		nova aggregate-list
 
3. The following commands will add a compute host to your newly created availability zones. Issue this command for every compute host that you wish to associate with an availability zone.
	
		nova aggregate-add-host <id> <hostname>
 
4. The following command can be used to list all availability zones and the compute hosts associated with them.

		nova availability-zone-list

#### Quotas

The **Database Service** will be installed into the admin tenant of the Helion OpenStack overcloud and the admin tenant must have sufficient quota available and unused resources for the service to use. To check existing quota availability, log-in to Horizon as the **admin** user and open the **Overview** panel under the **Compute** tab.

If you are not configuring the Database Service to be highly available you must have the following quota available:
	
<table>
  <thead>
    <tr><th>Resource</th>
  <th align="right">Usage</th>
</tr>
  </thead>
  <tbody>
    <tr><td>Floating IPs</td>
  <td align="right">6</td>
</tr>
    <tr><td>Instances</td>
  <td align="right">6</td>
</tr>
    <tr><td>Networks</td>
  <td align="right">2</td>
</tr>
    <tr><td>RAM (GB)</td>
  <td align="right">24</td>
</tr>
    <tr><td>Routers</td>
  <td align="right">2</td>
</tr>
    <tr><td>Security Groups</td>
  <td align="right">6</td>
</tr>
    <tr><td>Volumes</td>
  <td align="right">4</td>
</tr>
    <tr><td>Volume Storage (GB)</td>
  <td align="right">160</td>
</tr>
  </tbody>
</table>

	
If you have setup Availability Zones and plan to install the Database Service in a highly available configuration you must have the following quota available:

<table>
  <thead>
    <tr><th>Resource</th>
  <th align="right">Usage</th>
</tr>
  </thead>
  <tbody>
    <tr><td>Floating IPs</td>
  <td align="right">16</td>
</tr>
    <tr><td>Instances</td>
  <td align="right">16</td>
</tr>
    <tr><td>Networks</td>
  <td align="right">2</td>
</tr>
    <tr><td>RAM (GB)</td>
  <td align="right">64</td>
</tr>
    <tr><td>Routers</td>
  <td align="right">2</td>
</tr>
    <tr><td>Security Groups</td>
  <td align="right">6</td>
</tr>
    <tr><td>Volumes</td>
  <td align="right">4</td>
</tr>
    <tr><td>Volume Storage (GB)</td>
  <td align="right">160</td>
</tr>
  </tbody>
</table>

In addition to the quota mentioned above, for every database instance that is created by a user, the necessary resources to create that instance will be deducted from the admin tenant quota. The users database service quota will also be affected.

### Connect to the Download Service

1. Open Horizon and login as the "admin" user. Then click on the admin panel in Horizon and select the **Development Platform** panel under Admin. Then click on the **Configure Services** sub-panel.

2. Click the **Connect** button on the **Configure Services** panel and enter your username and password for the HP Cloud OS Content Delivery Network. Select the Sign-up button if you do not have an account.

### Download and Configure the Database Service

In the **Configure Services** panel locate the Database Service item in the Configure Services table and select **Download Service** and wait for the download to complete.

#### Configuring the Database Service

1. Once the download is complete, click the **Configure Service** button to begin configuration of the service. In the configuration dialog, specify the following configuration options:

	**Key Pair (Required)** - Key Pair to install on all instances created as part of the database service. The public key can be used by an admin to get SSH access to all instances.

	**External Network (Required)** - Network Name for the network that has external network access. For HP Helion OpenStack Commercial Edition this network is named 'ext-net'

	**NTP Server IP** - IP Address to an NTP server to use if instances will not have outbound access to the internet. 

	**Service User Password (Required)** - The password for the Admin user that is currently logged in. This password **MUST** match the password used to login to Horizon.

	**Icinga User Password (Required)** - Specify a password for the Icinga service that is created as part of the install. Keep this password for future use.

	**Volume Type (Required)** - The volume type to use when creating database instances.

	**Enable HA** - Specify if the database service is to be setup in an HA configuration. If selected, each component of the service will have three instances created and active at all times.

	**RabbitMQ IP Address (Required)** - Specify the IP address of the central Helion OpenStack Logstash server.

2. After all configuration options have been provided, select the **Configure** button to complete the configuration step. Wait for the configuration step to complete and the status to change to **Configured**.
3. The following steps will configure the load balancer to take advantage of the highly available database service. Only execute these steps if you have configured Availability Zones and selected the "Enable HA" option when configuring the **Database Service**. To perform the following steps you must be connected to the undercloud node.
	
	1. Identify the API server IPs on the SVC network:

			$ nova list | awk '/trove[0-9]*_api/{ print $12 }' | cut -d "=" -f 2
		You should have as many API servers (and IPs) as you have AZs in your Helion OpenStack install.

	2. Identify the Virtual IP used by the controller nodes to be able to load balance the Helion 	OpenStack services:
			
			$ keystone endpoint-list | awk '/8779/{ print $6}' | egrep -o "[0-9]+.[0-9]+.[0-9]+.[0-9]+"

	3. Update configuration on each of the Helion OpenStack controller nodes by connecting to the controller and doing the following:

		a. Edit the /etc/haproxy/manual/paas.cfg and add the following lines. The last line should be repeated once for each API server identified in step 1. 
	
				listen trove_api
				bind <Virtual IP from step 2>:8779
				server trove-trove<n>_api-<uniqueid> <API server n's IP Address> check inter 2000 rise 2 fall 5

		b. Edit the /etc/iptables/iptables file and add to the end of it:

				-I INPUT -p tcp --dport 8779 -j ACCEPT

		c. Run the following command as root:

				$ sudo iptables -I INPUT -p tcp --dport 8779 -j ACCEPT
				
		d. Reload the haproxy service configuration
		
				$ sudo service haproxy reload

3. Log out from the Horizon dashboard. Log back into the Horizon dashboard as a non-admin user and click on the **Database** panel under the current Project to being using Database Service.

## Install the Marketplace Service<a name="install-marketplace"></a>
This section provides details on installing the Marketplace service from the Development Platform.

### Prerequisites

The **Marketplace Service** will be installed into the admin tenant of the Helion OpenStack overcloud and the admin tenant must have sufficient quota available and unused for the resources the service uses. To check existing quota availability, log-in to Horizon as the **admin** user and open the **Overview** panel under the **Compute** tab.

|Resource | Usage      | 
|--------------|-------------:|
|Floating IPs|           16|
|Instances|                4|         
|Networks|                1|
|RAM (GB)|               8|
|Routers|                   2|
|Security Groups|   4|

### Connect to the Download Service

1. Open Horizon and login as the "admin" user. Then click on the admin panel in Horizon and select the **Development Platform** Panel under Admin. Then click on the **Configure Services** sub-panel.

2. Click the **Connect** button on the **Configure Services** panel and enter your username and password for the HP Cloud OS Content Delivery Network. Select the Sign-up button if you do not have an account.

### Download and Configure the Marketplace Service

In the **Configure Services** panel locate the Application Lifecycle Service item in the Configure Services table and select **Download Service** and wait for the download to complete.

#### Configuring the Marketplace Service

1. Once the download is complete, click the **Configure Service** button to begin configuration of the service. In the configuration dialog, specify the following configuration options:

	**Key Pair (Required)** - Key Pair to install on all instances created as part of the marketplace service. The public key can be used by an admin to get SSH access to all instances.

	**External Network (Required)** - Network Name for the network that has external network access. For HP Helion OpenStack Commercial Edition this network is named 'ext-net'

	**NTP Server IP** - IP Address to an NTP server to use if instances will not have outbound access to the internet. 

	**Service User Password (Required)** - The password for the Admin user that is currently logged in. This password **MUST** match the password used to login to Horizon.

	**Subnet Range** - The subnet to use for Marketplace
	
## Troubleshooting<a name="troubleshooting"></a>

### Service is stuck in download

There are several situations in which a download will not complete.  One cause which is documented, is because the `tmp` directory ran out of space. There is a prerequisite to mount the `tmp` directory to a larger partition.  If you have completed this and it is still failing to download then we will need to reset the download. In the current release, this requires a manual process.

As the "admin" user, in the "admin" tenant, click on **Project**, then **Object Store**. Open the "sherpa-cache" folder and delete the wscatalog.<id> folder which contains the cached download. The service should now be available to download again.



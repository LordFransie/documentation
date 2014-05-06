---
layout: default
title: "HP Helion Public Cloud Console: Getting Started"
permalink: /hpcloudconsole/
product: HP Helion Public Cloud Console

---


# Getting Started with HP Helion Public Cloud Console
Welcome to HP Helion Public Cloud Horizon Console! We want you up and running quickly, so this Getting Started guide walks you through network setup and connection (if not going with the default configuration setup when you activate compute services), instance and volume creation, security options, identity parameters, and management tools that facilitate your organization's use of HP Helion Public Cloud. **This page takes you through the interface in the chronological order needed to get up and running, rather than the order displayed in the console**. 

After initial setup, revisit the interface to monitor usage, modify, add, and delete networks, instances, volumes, roles, groups, and more. For the latest updates to the current HP Helion Public Cloud Console release, see [What's new with HP Helion Public Cloud Console](/whats_new_with_HP_Cloud_Console/). 

For information on moving from the HP Classic Console to HP Helion Public Cloud Console see [Feature Mapping: HP Classic Console to the HP Helion Public Cloud Console](/hpcloudconsolefeaturemap). 


<img src="media/landingpage.png" width="580" alt="" />


This page contains the following sections:

* [Creating and connecting a network](#Createandconnect)
* [Managing HP Helion Public Cloud](#ManageHPPublicCloud)
* [For further information](#Forfurtherinformation)


##Creating and connecting a network## {#Createandconnect}

This section includes how to:

* [Create a network](#Createanetwork) 
* [Create a subnet](#Createasubnet) 
* [Create a router](#Createarouter)
* [Connect your network](#Connectyournetwork)

**Note**: A default configuration comes with HP Helion Public Cloud compute activation and includes:

* A network 
* A subnet
* A router connecting the subnets to the Internet
* A security group with basic server options, both SSH and Ping rules

You can use the default network to deploy HP Helion Public Cloud compute instances (virtual servers), or create a network configuration through the HP Helion Public Cloud Console with the following instructions.

###Create a network### {#Createanetwork}

1. Login to HP Helion Public Cloud with your username and password.

2. On the HP Helion Public Cloud console interface, click "Project," on the left-side bar then "Networks" under "Manage Networks."

    <img src="media/CreateaNetworkImage1.png" width="580" alt="" />

3. Click "+Create Network" in the right-hand navigation.

    <img src="media/CreateaNetworkImage2.png" width="580" alt="" /> 

4. Enter a "Network Name" in the "Create Network" pop-up screen, leave the "Admin" State box checked, and continue to the directions in "Create a subnet" below.

    <img src="media/CreateaNetworkImage3.png" width="580" alt="" />

###Create a subnet### {#Createasubnet}

1. Click the "Subnet" tab in the "Create Network" pop-up screen. **Note**: If you click the "Create" button on the "Network" pop-up before setting up a "Subnet,"  you are prompted to specify a network address or turn off the option to create a subnet through an error message.
2. Enter the subnet name.
3. Click in the "Network Address" box. The pop-up message states the network address is in Classless Inter-Domain Routing (CIDR) format; i.e.,  000.000.0.0/00. Enter the network address displayed: 192.168.0.0/24.
4. Keep the IPv4 default in the "IP Version" box unless you know you have moved to IPv6.
5. Leave the "Gateway IP" box blank to use the default value of the network address; e.g., 192.168.0.1 for 192.168.0.0/24.
6. Leave the "Disable Gateway" box unchecked to use the default and click "Create." 

    <img src="media/CreateaSubnetImage1.png" width="580" alt="" />

7. The "Networks" screen displays your network name and associated subnets.

    <img src="media/CreateaSubnetImage2.png" width="580" alt="" />

8. To see a graphic display of your network setup, click "Network Topology" under "Manage Network" in the left-hand navigation.  

    <img src="media/CreateaSubnetImage3.png" width="580" alt="" />

###Create a router### {#Createarouter} 

1.  If on the "Network Topology" screen, click "Create Router" in the top right-hand navigation. If not, click "Routers" under the "Manage Network" heading in the left-hand navigation.

    <img src="media/CreateaRouterImage1.png" width="580" alt="" />

2.  If you clicked "+Create Router" on the "Network Topology" screen, enter your router name and click "Create Router." If you clicked "Routers" under "Manage Network", click "+Create Router" in the upper right-hand navigation and enter the router name in the pop-up. 
    
3. Click "Router" in the left-hand navigation to see the router name and status. **Note**:  Click the router "Name" to display its ID number and status. If you do this, click "Routers" in the left-hand navigation to make the "Set Gateway" action available for the following step or click the "Back" button in your browser.

    <img src="media/CreateaRouteImage2.png" width="580" alt="" />

4. On the "Routers" page, click "Set Gateway" under "Actions" to connect your router to the Internet.

     <img src="media/CreateaRouterImage3.png" width="580" alt="" />

5. Click the drop-down menu in the "External Network" box in the "Set Gateway" pop-up, select "Ext-Net," and click "Set Gateway."

    **Note**: The external network is the router's default route, with the router acting as a gateway for external connectivity. While you can configure a subnet that is internal-only, you must connect it to another subnet with external connectivity.
    
    <img src="media/CreateaRouterImage4.png" width="580" alt="" />
    
###Connect your network### {#Connectyournetwork}

1. Click the router name on the "Routers" page.

2. Click "+Add Interface" on the far-right of the "Router Details" page. 

    <img src="media/Connectyournetworkimage1.png" width="580" alt="" />

3. Click the drop-down menu in the "Select Subnet" box in the "Add Interface" pop-up and click on the network you configured. **Note**: You can optionally specify an IP address in the box provided, but the default interface IP address is the selected subnet's external gateway and the best choice unless you are setting up a more complicated connection. Any IP address you specify must belong to the subnet in the drop-down menu. 

4. Click "Add Interface."

    <img src="media/Connectyournetworkimage2.png" width="580" alt="" />

**Important: To delete a network, you must delete any instances running on that network (instance creation covered below) and the router interface before deleting the network. If you don't have instances on the network, you still have to delete the router interface before deleting the network**:

1. If you have created an instance, click "Instances" on the left-hand bar under "Manage Compute."

2. Select the check box for any instance running on the network you want to delete and click "Terminate Instances" in the upper right-hand navigation. 

3. Click "Routers" under "Manage Network in the left-hand bar.

4. Click on the router "Name." 

5. On the "Router Details" page, select the check box next to the "Interface" name, and click "Delete Interface." 

6. Click "Networks" in the left-hand bar, select the check box next to the network you want to delete, and click "Delete Networks" in the upper right-hand navigation. 

##Managing HP Helion Public Cloud## {#ManageHPPublicCloud}

You are now ready to use the options under "Manage Compute" under "Project" in the left-hand navigation. This section includes:

* [Overview](#Overview)
* [Create an instance](#Instance)
* [Create and attach a volume](#Volumes)
* [Images and Snapshots](#Imagesandsnapshots)
* [Monitoring](#Monitoring)
* [Access and Security](#Accessandsecurity)


###Overview### {#Overview}

Select "Overview" under "Manage Compute," to display your usage summary and quotas for:

* Instances
* VPCUs
* RAM
* Floating IPs
* Security Groups

As you use HP Helion Public Cloud, click on the "Overview" options any time to query current usage as well as usage during specific time frames.

####Create an instance#### {#Instance}

An instance is a virtual server.

**Note**: HP Helion Public Cloud provides a list of images from which you can boot an instance.  While you can also boot from an HP Helion Public Cloud instance you have launched using "Images and Snapshots," it is unnecessary to get up and running and beyond the scope of this document.   

1. Click "Instances" under "Manage Compute" in the left-hand navigation.

2. Click "+Launch Instance" in the upper right-hand navigation of the screen. 

    <img src="media/CreateaninstanceImage1.png" width="580" alt="" />

3. You can leave the default choice of the "Any Availability Zone" (AZ) box, which arbitrarily assigns an AZ for an instance or click the drop box to specify  where to locate an instance. **Note**: The default choice locating an instance in any AZ offers high availability, ensuring a high level of operational performance. You can also specify an AZ for an instance if you want to segregate AZs per function for your own organizational purposes; e.g., you could select AZ1 for your data center, and set the remaining two up later for other discrete functions. Such a setup is completely optional as the AZs share all information and work in tandem.

4. Enter a name in the "Instance Name" box.

5. Click the drop-down menu under "Flavor" to select the hardware configuration you want to emulate, i.e., how much disk space and RAM you need. When you select a flavor, the "Flavor Details" box displays the following:

    * Name
    * # of VCPUs
    * Root disk size
    * Ephemeral disk size
    * Total disk size
    * RAM usage

    **Note** The "Project Limits" box under "Flavor Details" graphically displays quotas allowed and usage of Instances, VCPUs, and Total RAM after you select a flavor.

    <img src="media/CreateanInstanceImage2.png" width="580" alt="" />

6. Enter the number of instances you want to create under "Instance Count."

7. Select the "Instance Boot Source" source from the drop-down menu. To select an HP Helion Public Cloud default image, select "Boot from Image" from the drop-down.  

    <img src="media/CreateanInstanceImage3.png" width="580" alt="" />

8. Click the "Select Image" drop down under "Image Name." Select one of the images HP Helion Public Cloud provides.

    <img src="media/CreateanInstanceImage4.png" width="580" alt="" />

9. Click the "Networking" tab in the upper navigation of  "Launch Instance" and click the "+" next to the network you want to launch an instance from.  You can also drag and drop the network from which you want to launch the instance from the "Available Networks" box to the "Selected Networks" box.

    **Note** If you click "Launch" before clicking the "Networking" tab, an error message displays; however, you can still select the network desired from the "Available Network" box to the "Selected Networks" box.

10. Click "Launch."

    <img src="media/CreateanInstanceImage5.png" width="580" alt="" />

###Create and Attach a Volume### {#Volumes}

A volume is a block storage device you attach to an instance.

**Note**: HP Helion Public Cloud provides a list of images from which you can boot an instance or volume.  While you can also boot from an HP Helion Public Cloud instance you have launched using "Images and Snapshots," it is unnecessary to get up and running in HP Helion Public Cloud and beyond the scope of this document.  
 
1. In the left-hand navigation, click "Volumes" under "Manage Compute."

2. Click "+Create Volume" in the upper right-hand navigation.

    <img src="media/VolumeImage1.png" width="580" alt="" />

3. Enter a name under "Volume Name" and, optionally, a description in the box below and a "Type" from the following drop-down menu.

4. Staying within the "Volume Limits" shown in the "Create Volume" box, enter a number of GBs under "Size."

    <img src="media/VolumeImage2.png" width="580" alt="" />

5. Select a volume source from the drop-down menu. 

6. If you select "Image" as your volume source, click the drop-down menu for "Choose an image" under the "Use image as a source" box that appears. Click on the image you want to use. 

    <img src="media/VolumeImage3.png" width="580" alt="" />

7. Select an AZ. HP Helion Public Cloud recommends the pre-filled "Any Availability Zone."

8. Click "Create Volume."

    <img src="media/VolumeImage4.png" width="580" alt="" />

9. To attach the volume to an instance, click "Edit Volume" under "Action" on the "Volumes" page.

    <img src="media/VolumeImage5.png" width="580" alt="" />

10. Select an instance to attach the volume to from the drop-down menu on the "Manage Volume Attachments" page.

11. Under "Device Name," you can specify a location in the system if desired or enter the displayed default. **Note**: If choosing the default, you must still enter it manually even though it is displayed (greyed out). Otherwise, you receive an error message that you must specify a location. 

12. Click "Attach Volume."

    <img src="media/VolumeImage6.png" width="580" alt="" />


###Images and Snapshots### {#Imagesandsnapshots}

**Functionality Overview**

**Important**: HP Helion Public Cloud provides a list of images from which you can boot an instance.  While you can also boot from an HP Helion Public Cloud instance you have launched and customized using "Images and Snapshots," it is unnecessary to get up and running in the Cloud and beyond the scope of this document. 

While this document does not cover creating snapshots, click "Images and Snapshots" in the left-hand bar to view available server and volume images and their details. For more details, click the image name on the "Images" page. Images listed under "Public" are available to anyone. "Project" images are for your specific project only.

###Access and Security### {#Accessandsecurity}
Security groups and security group rules allow you to specify the type of traffic and direction (inbound/outbound) that are allowed to pass through a project's network port(s). When you create a project in HP Helion Public Cloud, you must also create security group rules to define access types through its ports, designating security group members depending on their job functions and access needs. 

When a port is created in HP Helion Public Cloud Networking it is associated, unless you specify otherwise, with a default security group that allows inbound traffic from the same subnet and all outbound traffic. You can add security group rules to the default security group to modify access or create a new security group to contain the rules you need.

Security group rules have three parts:  

1. Rule - A rule template or rules you create. For example, if setting up a VM as a mail server, you might select Custom TCP Rule, Custom UDP Rule, or Custom ICMP Rule. 

2. Open Port/Port Range: Open a single port or a range of ports.

3.  Remote: For this rule, you must specify the source of allowed traffic in either the form of an IP address block (CIDR) or through a security group. 

####Default security group####
1. Click "Access & Security" in the left-hand bar under "Manage Compute" and "Project" to begin.

    <img src="media/Accesssecurity1.png" width="580" alt="" />

2. A default security group is already set up. To display the default rules, click the "Edit Rules" button next to "default" on the "Security Groups" page. As shown below, the default security group rules have "Ether Types" IPv4 and IPv6 set up for "Ingress" (Incoming) and "Egress" (Outbound) directions. **Note**: It may be easiest to add any new security group rules to the default group so you do not have to recreate ingress and egress directions. 

    <img src="media/Accesssecuritydefaultsecuritygrouprulesimage2.png" width="580" alt="" />

3. Click the "+Add Rule" button in the top-right navigation if you want to create a new rule in the default security group.

    <img src="media/Accesssecurityaddruletodefault.png" width="580" alt="" />

4. In the "Add Rule" box, make selections for the rule as outlined below. Additional selections may pop up depending on your setup choices.

    <img src="media/Accesssecurityaddrulebox.png" width="580" alt="" />

5. Click the "Rule" drop-down box and make a selection based on the function of your VM.

6. Select "Port" to open a single port, or "Port Range" to specify a range from the drop-down under "Open Port."  Enter the port number or start and end port numbers based on your selection. 

7. Select "CIDR" or "Security Group" from the drop-down under "Remote" to specify the source of the allowed traffic for the rule. If CIDR, enter an IP address block under "CIDR." If "Security Group," select the name from the drop-down box, then designate IPv4 or IPv6 under "Ether Type." If you do not already know you are using IPv6, select IPv4.

8. Click "Add."

9. To delete a rule from the default group, click "Access & Security" in the left-hand bar, then click "Edit Rules" to the right of the default security group, which is what you did to add a rule.

10. Click "Delete Rule" next to the rule you want to get rid of.

    <img src="media/Accesssecuritydeletedefaultgrouprule.png" width="580" alt="" />


####New security group#### 

1. Click "Access & Security" in the left-hand bar under "Manage Compute" and "Project" to begin.

    <img src="media/Accesssecurity1.png" width="580" alt="" />

2. Click "+Create Security Group" in the upper right-hand navigation.

    <img src="media/ASCreatenewsecuritygroup.png" width="580" alt="" />

3. Enter a name in ASCII-only characters and numbers, a description, then click "Create Security Group."

4. Click "Edit Rules" next to the new security group under "Actions" in the right-hand navigation to add security group rules. 

    <img src="media/ASClickeditrules.png" width="580" alt="" />


5. Click the "+Add Rule" button in the top-right navigation.

    <img src="media/Accesssecurityaddruletonewgroup.png" width="580" alt="" />
    

6. Click the "Rule" drop-down in the "Add Rule" box and make a selection based on the function of your VM.

7. Click the "Direction" drop-down box and select "Egress" to designate outbound traffic or "Ingress" to designate inbound traffic.

8. Select "Port" to open a single port, or "Port Range" to specify a range from the drop-down under "Open Port."  Enter the port number or start and end port numbers based on your selection. 

9. Select "CIDR" or "Security Group" from the drop-down under "Remote" to specify the source of the allowed traffic for the rule. If CIDR, enter an IP address block under "CIDR." If "Security Group," select the name from the drop-down box, then designate IPv4 or IPv6 under "Ether Type." If you do not already know you are using IPv6, select IPv4. 

10. Click "Add" and your new rule displays in the security group.

    <img src="media/ASNewruledisplay.png" width="580" alt="" />

11. Click "Delete Rule" next to a rule you want to get rid of.

12. Click "Access & Security" in the left-hand bar to display your security groups.

    <img src="media/ASSecurityGroupsdisplay.png" width="580" alt="" />
    
    
###Monitoring### {#Monitoring}

Use HP Helion Public Cloud Monitoring to ascertain system health and track resource metrics. Create the following in the HP Helion Public Cloud Console to define the metrics you want to gather, where you want them sent, and configure an alarm that sends them:

* An endpoint that specifies the metrics to gather
* Subscriptions that specify which metrics to stream to an endpoint
* Notification addresses to receive email and/or SMS alarm messages
* Alarms to define conditions that trigger end-user notification  

After completing these tasks, you receive the metrics in JSON format at the locations you specified when an alarm is triggered. The metrics are streamed over an [AMQP](http://www.amqp.org/about/what) socket. Select the tool of your choice to create graphical representations of the metrics.

####Begin:####
1. Click "Manage Services" in the left-hand bar on the [HP Helion Public Cloud Console landing page](https://horizon.hpcloud.com/landing), then "Activate" in the "Monitoring" row under the region you are setting up.

<img src="media/Monitoring1.png" width="580" alt="" /> 

2. Once activated, click "Monitoring" under the "Actions" heading on the [landing page](https://horizon.hpcloud.com/landing) to begin.

    <img src="media/Monitoring2.png" width="580" alt="" />    


####Create endpoints####

     
1. Click "+Create Endpoint." You can create only one, total. **Note**: Record the password for the generated endpoint in the pop-up display. It cannot be retrieved later. If you lose the password, click the "Reset Password" button under "Actions" on the "Endpoints" page.

    <img src="media/Monitoring3CreateEndpoint.png" width="580" alt="" />    
     
2. Click the endpoint ID in the "Endpoints" screen to display the endpoint ID, the URI, the queue, and the user name.

    <img src="media/Monitoring5EndpointDisplaybox.png" width="580" alt="" />


####Create subscriptions to endpoints####

1. Click "Subscriptions" under "Manage Monitoring" in the left-hand bar.

2. Click "+Create Subscription" in the upper-right corner of the "Subscriptions" page.

3. Select an endpoint ID to subscribe to from the drop-down menu in the "Create Subscription" box.

4. Select the namespace of the metrics to receive from the drop-down menu.

5. Select an instance from the drop-down menu.

6. Click "Create Subscription" in the lower-right of the "Create Subscription" box.

    <img src="media/SubscriptionSelect.png" width="580" alt="" />


####Create notification addresses for subscriptions####

1. Click "Notifications" under "Monitoring" in the left-hand bar.

2. Click "+Create Notification Address" in the upper-right of the "Notifications" page.

    <img src="media/Notification1.png" width="580" alt="" />

3. Enter a notification address name in the "Create Notification Address" box.

4. Select "Email" or "SMS" from the "Type" drop-down menu.

5. Enter an address in the "Address" box. For SMS, use the E.164 for international telephone numbers, which requires a "+" followed by the country code, then the regional number. **Note**: Currently, only US phone numbers are supported. 

6. Click "Create Notification Address."

    <img src="media/Notification2.png" width="580" alt="" />

7. Click "Verify Address" under "Actions" in the row for the address you just created.

    <img src="media/Notification3.png" width="580" alt="" />

8. Enter the Verification Code you received at your specified notification address from the monitoring service in the "Verify Notification Address." 

9. Click "Verify Address."

    <img src="media/Notification4.png" width="580" alt="" />

10. Click "Create Notification Method" under "Actions" on the "Notifications" page.

    <img src="media/Notification5.png" width="580" alt="" />


11. Enter a notification method name in the "Name" box, a type, and an email address, and click "Create Notification Method."


####Create alarm name####

1. Click "Alarms" under "Manage Monitoring" in the left-hand bar.

2. Click "+Create Alarm" in the upper-right hand of the "Alarms" page.

    <img src="media/Alarms1.png" width="580" alt="" />

3. Enter alarm name in "Create Alarm" box.

4. Enter an alarm expression as indicated under "Description" in the "Create Alarm" box.  [Click](http://docs.hpcloud.com/api/v13/monitoring/#AlarmExpressions-jumplink-span) to see the "Alarm Expressions" section for setup information or use the link in the interface. When the expression you set is true, it triggers a notification.

5. Select an alarm action name and click "Create Alarm."

   
    <img src="media/Alarms2.png" width="580" alt="" />

     

###Organize and manage HP Helion Public Cloud access## {#Identity}

Click  "Identity" in the left-hand interface to display links:

* Domain - The domain is your primary work space in HP Helion Public Cloud.  An individual or company can be the domain owner and enables a project with the necessary services and permissions. The first user created in a domain is considered the domain owner and placed in both the "Users" and "Domain Administrators" groups. 

    A domain has one owner and may have multiple users, groups and roles. A domain owner can allow users of another domain access to its projects.

* Projects - A project is a collection of HP Helion Public Cloud services, e.g., compute, storage, etc. within a domain  A project is defined by selecting services to be activated and a set of users to interact with the services. A project may contain multiple services, such as compute or object storage. Services can exist multiple times within the same project as long as they have different service endpoints, distinguished by their geography and region.

* Users - Users are defined individually and can be assigned to groups and granted roles either directly or through inclusion in groups.  A user may have multiple roles.

* Groups - When you create a domain, two default groups are created: Users and Domain Administrators. Domain Administrators can add individuals to a group and create new groups, which may contain multiple users. 

* Roles - A role is a user or group  capability within a  service that determines access rights. Roles include  Compute Admin, Network Admin, Object Storage Admin, and others.  Domain owners can  assign roles to individuals or groups. A role may be associated with multiple users and multiple groups.


##For further information## {#Forfurtherinformation}

*For the latest updates to the current HP Helion Public Cloud Console release, see [What's new with HP Helion Public Cloud Console](/whats_new_with_HP_Cloud_Console/)..
* For basic information about our HP Helion Public Cloud compute services, take a look at the [HP Helion Public Cloud compute overview](/compute/) page
* If you'd rather use the HP Helion Public Cloud Command Line Interface (CLI) features, choose your topic of interest from our [HP Helion Public Cloud CLI](/cli) pages.



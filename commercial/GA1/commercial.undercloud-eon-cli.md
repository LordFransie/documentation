---
layout: default
title: "HP Helion OpenStack&#174; Command Line Interface- EON"
permalink: /helion/openstack/undercloud/eon/cli/
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
<p style="font-size: small;"> <a href="/helion/openstack/services/compute/overview/">&#9664; PREV</a> | <a href="/helion/openstack/services/overview/">&#9650; UP</a> | <a href="/helion/openstack/services/imaging/overview/"> NEXT &#9654</a> </p>

-->

# HP Helion OpenStack&#174;: Command Line Interface- EON 


The EON client CLI package provides an http-client coupled command-line tool for managing Eon (ESX management) services.
 

You can issue the following command using the EON client CLI package in the undercloud:


* [Help Commands](#help)
* [API Command](#api-command)
* [vCenter Commands](#vcenter-commands)
* [Cluster Commands](#cluster-commands)
* [Compute Proxy Commands](#proxy-command)
* [Required Commands](#required-arguments)

 
##Help Commands<a name="help"></a>

###Help

You can display help for this program or one of its sub-programs.

   	`eon --help `


###Help Subcommand

You get two sets of arguments: Positional (mandatory) and Optional arguments (all mandatory fields are marked within *[Required]*).

   ` eon help <sub-command> `


You can use the following commands to view the help.


##API Command<a name="api-command"></a>

### Bash-completion<a name="bash-completion"></a>

Prints all of the commands and options to the standard output.

	# eon bash-completion


##vCenter Commands<a name="vcenter-commands"></a>

###List vCenters<a name="list-vcenters"></a>

You can view the list of vCenters in your cloud environment. 


  	 # eon vcenter-list 


###View vCenter details<a name="view-vcenter-details"></a>

You can view the details of the specific vCenter. 

	# eon vcenter-show <VCENTER_ID>


### Add vCenter<a name="add-vcenter"></a>

You can add the vCenter to the EON database. You must enter all the arguments to add the vCenter; otherwise you will be prompted to enter them. 

	# eon vcenter-add --name <VCENTER_NAME> --ip-address <VCENTER_IP> --username <VCENTER_USERNAME> --password <VCENTER_PASSWORD> --port <VCENTER_PORT> --proxy-config-file <VCENTER_PROXY_CONFIG_FILE>


**Note**: HP Helion OpenStack&#174; supports three vCenters.

 * &lt;VCENTER_NAME>: Name of the vCenter 
                        
 * &lt;VCENTER_IP>: IP address of the vCenter.
                         
 * &lt;VCENTER_USERNAME>: Username of the vCenter administrator. 
                       
 *  &lt;VCENTER_PASSWORD>: Password of the vCenter administrator.

 *  &lt;VCENTER_PORT>: Port of the vCenter. 

 * &lt;VCENTER&#095;PROXY&#095;CONFIG&#095;FILE>:  File location of the proxy configuration.


### Update vCenter<a name="update-vcenter"></a>

You can update the exisitng vCenter to the EON database. You must enter all the arguments to add the vCenter; otherwise you will be prompted to enter them. 


	# eon vcenter-update [--name <VCENTER_NAME>] [--ip-address <VCENTER_IP>][--username <VCENTER_USERNAME>][--password <VCENTER_PASSWORD>][--port <VCENTER_PORT>]                       <VCENTER_ID>


### Delete vCenter<a name="delete-vcenter"></a>

**Important:** If you have any imported cluster ensure that you have deactivated them and then un-import the cluster(s) before executing the delete command.

vCenter delete fails:

* if you have any imported clusters that are activate clusters.

You can delete the vCenter from the EON database.  

	# eon vcenter-delete <VCENTER_ID>


###List vswitch<a name="vswitch-list"></a>        
You can view the list of vswitches of vCenter.

    # eon vswitch-list <VCENTER_ID>


###View vswitch details<a name="vswitch-show"></a>        

You can view the vswitch details. The ID of vCenter and MOID of vswitch will be displayed.

	 # eon vswitch-show --vswitch-moid <VSWITCH_MOID> <VCENTER_ID>


### Host details<a name="host-details"></a>

You can view the list of hosts of cluster details of the host when cluster `moid` is specified.

	 # eon host-list --vcenter-id <VCENTER_ID> [--clusters <CLUSTER_MOIDS> [<CLUSTER_MOIDS> ...]]

##Cluster Commands<a name="cluster-command"></a>

###List clusters<a name="list-clusters"></a>

You can view the list of clusters available for the given vCenter. 

	# eon cluster-list --vcenter-id <VCENTER_ID>


###View cluster details<a name="view-cluster-details"></a>

You can view of the details of the specific cluster. 

	 # eon cluster-show --vcenter-id <VCENTER_ID> --cluster-moid <CLUSTER_MOID>


###Import clusters<a name="import-cluster"></a>

You can import the clusters in the EON database under the give vCenter. 

	# eon import-cluster --vcenter-id <VCENTER_ID> --cluster-name <CLUSTER_NAME> --cluster-moid <CLUSTER_MOID>

In the vCenter you can import the cluster(s). One vCenter can have multiple clusters.

###Update a cluster<a name="cluster-update"></a>
You can update the cluster details. 

	# eon cluster-update --vcenter-id <VCENTER_ID> --cluster-moid <CLUSTER_MOID> --state <STATE>


###Unimport clusters<a name="unimport-clusters"></a>

You can un-import the cluster(s) from the EON database under the give vCenter. 

	# eon unimport-cluster --vcenter-id <VCENTER_ID> --cluster-moid <CLUSTER_MOID>


###Activate clusters<a name="activate-clusters"></a>
You can activate the clusters using the following:

	# eon activate-clusters --vcenter-id <VCENTER_ID> --clusters <CLUSTER_MOIDS> [<CLUSTER_MOIDS> ...]


### Deactivate clusters<a name="deactivate-clusters"></a>
You can deactivate clusters.   

 	# eon deactivate-clusters --vcenter-id <VCENTER_ID> --clusters <CLUSTER_MOIDS> [<CLUSTER_MOIDS> ...]

            

##Compute Proxy Commands<a name="proxy-command"></a>

###List of compute proxy<a name="compute-proxy-list"></a>  

View the list of compute proxies.

	# eon compute-proxy-list


### Restore proxy<a name="restore-proxy"></a>       

In case of failure of Proxy-VM, the Compute Proxy VM can be restored to the previous configuration using the following command. In other words, it recreates the Compute Proxy virtual machine with previously activated clusters.


	# eon restore-proxy <VCENTER_ID>


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>



##Required Commands {#required-arguments}

The following options must be supplied as arguments or as environment variables.

###OS username<a name="os-username"></a>
Username of the keystone (OpenStack environment). Defaults to env[OS_USERNAME].
  
	# --os-username OS_USERNAME
                        
 
###OS password<a name="os-password"></a> 
Password of the keystone (OpenStack environment).  Defaults to env[OS_PASSWORD].
	
	# --os-password OS_PASSWORD
                       
 
###OS tenant ID<a name="os-tenant-id"></a>
Tenant identification of the OpenStack environment. Defaults to env[OS&#095;TENANT&#095;ID].

	# --os-tenant-id OS_TENANT_ID
                                           
 
###OS authentication URL<a name="os-auth-url"></a>
Authentication URL of the OpenStack environment. Defaults to env[OS&#095;AUTH&#095;URL].
 
	# --os-auth-url OS_AUTH_URL

###OS authenticationtoken<a name="os-auth-token"></a>
Authentication token of the OpenStack environment. Defaults to env[OS&#095;AUTH&#095;TOKEN].

  	# --os-auth-token OS_AUTH_TOKEN



<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*

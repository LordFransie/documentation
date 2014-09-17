---
layout: default
title: "HP Helion OpenStack&#174; Compute Service Overview"
permalink: /helion/openstack/services/compute/overview/
product: commercial

---
<!--PUBLISHED-->

<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>


<p style="font-size: small;"> <a href="/helion/openstack/services/tripleo/overview/">&#9664; PREV</a> | <a href="/helion/openstack/services/overview/">&#9650; UP</a> | <a href="/helion/openstack/services/identity/overview/"> NEXT &#9654</a> </p>

# HP Helion OpenStack&#174; Compute Service Overview #

Leveraging OpenStack technology, the HP Helion OpenStack Compute Service provides a way to instantiate virtual machine instances on publicly accessible physical machines hosted in your cloud environment.

Compute allows you to work with *flavors*, which are unique combinations of disk space, memory capacity, and CPU; *images*, which are collections of files used as a base installation, typically operating systems such as Ubuntu 10.10; and *servers*, which are virtual instances created using a flavor and an image

A variety of flavors and images are provided by HP Compute that can be used to create a wide mix of servers.

##Key Terms

Key terms include:

- **Flavor** - A unique combination of disk space, memory capacity, and CPU.

- **Image** - A collection of files used as a base installation, typically an operating system such as Ubuntu 10.10 or something similar.

- **Server** - An instance created out of a flavor and an Image.

## Working with the Compute Service ##

To [perform tasks using the Compute service](#howto), you can use the dashboard, API or CLI.

### Using the dashboards {#UI}

You can use the [HP Helion OpenStack Dashboard](/helion/openstack/dashboard/how-works/) to work with the Compute service.

###Using the API ### {#API}
 
You can use a low-level, raw REST API access to the HP Compute service. See the [OpenStack Compute API v2.0 Reference](http://api.openstack.org/api-ref-compute-v2.html).

###Using the CLI### {#cli}

You can use the command-line interface software to access HP Compute. See the [OpenStack Command Line Interface Reference](http://docs.openstack.org/cli-reference/content/novaclient_commands.html).

For more information on installing the CLI, see [Install the OpenStack command-line clients](http://docs.openstack.org/user-guide/content/install_clients.html).

## How To's with the HP Helion OpenStack Compute Service ## {#howto}

<!-- Taken from http://wiki.hpcloud.net/display/core/Core+Edition+Use+cases#CoreEditionUsecases-OverCloud -->

The following lists of tasks can be performed by a user or administrator through the [HP Helion OpenStack Dashboard](/helion/openstack/dashboard/how-works/), the [API](http://api.openstack.org/api-ref-compute-v2.html), or [CLI](http://docs.openstack.org/cli-reference/content/novaclient_commands.html).

Depending upon your user type, user or administrator, you can perform the following tasks.

### Tasks performed by users ###

The following Compute service tasks are usually performed by someone with the *user* role.

#### Working with instances ####

When working with the Compute service, you can perform a number of tasks with your virtual machine instances, including creating and deleting instances, starting and stopping an instance, and attaching a storage volume to an instance.

- **Launching an instance** -- Create a new virtual machine.
- **Launching an instance that boots from a Volume** -- Create a bootable virtual machine associated with a bootable volume. 
- **Rebooting an instance** -- Reboot an instance.
- **Rebuilding an instance** -- Rebuild an instance as needed.
- **Starting and stopping an instance** -- Use the Compute service to start and stop an instance.
- **Creating and deleting a snapshot of an instance** -- Create a snapshot of an instance that you can use to create other instances.
- **Rescuing and un-rescuing an instance** -- Rescue a instance.
- **Deleting an instance** -- Delete an instance that is no longer needed.
- **Attaching and detaching volumes** -- Attach a storage volume to an instance and detach the volume, when no longer needed.
- **Viewing an instance console log** -- Display a log of virtual machine activity.
- **Viewing a VNC console connection to an instance** -- Remotely connect to an instance using a VNC (Virtual Network Computing) console. 
- **Associating and disassociating a floating IP address** -- Allocate and associate floating IP addresses to an instance. 

#### Working with security ####

You can use different tools to help secure your cloud.

- **Working with security groups** -- Create, modify, and delete the security groups in your project.
- **Working with security group rules** -- Create, modify, delete a security group rule that control traffic to or from instances.
- **Working with key pairs** -- Create and delete the key pairs that control access to the instances in your environment. You can also import an existing key pair.

### Tasks performed by an Administrator ###

The following Compute service tasks are usually performed by someone with the *administrator* role.

#### Creating, modifying and deleting flavors ####

Use the Compute service to create, delete, and modify the virtual machine *flavors* in a project. A flavor defines the hardware configuration (disk space and memory capacity).

#### Modifying project quotas ####

Use the Compute service to change the maximum limits on the number of objects (instances, volumes, and so on).

#### Creating, modifying, and deleting availability zones ####

Use the Compute service to manage availability zones (AZ) by creating and deleting AZs and modifying existing AZs.

#### Enabling and disabling services ####

Use the Compute service to enable or disable services available in a project.

#### Working with an instance ####

When working with the Compute service, you can perform a number of tasks with your virtual machines (VM).

- **Locking and unlocking instances** -- Lock or unlock an instance, as needed.
- **Pausing and un-pausing instances** -- Pause and un-pause an instance. The `pause` command stores the state of the instance in RAM. A paused instance continues to run in a frozen state.
- **Suspending and resuming virtual machines** -- Suspend and un-suspend an instance. When you suspend an instance, its instance state is stored on disk, all memory is written to disk, and the instance is stopped. Suspending an instance is similar to placing a device in hibernation; memory and vCPUs become available.

## For more information ##

For information on how to operate your cloud we suggest you read the [OpenStack Operations Guide](http://docs.openstack.org/ops/). The *Architecture* section contains useful information about how an OpenStack cloud is put together. However, HP Helion OpenStack takes care of these details for you. The *Operations* section contains information on how to manage the system.
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593;</a>


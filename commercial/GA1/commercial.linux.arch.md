---
layout: default
title: "HP Helion OpenStack&#174; Release Notes"
permalink: /helion/openstack/install/linux/arch/
product: commercial.ga

---
<!--UNDER REVISION-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>
<!--
<p style="font-size: small;"> <a href="/helion/openstack/">&#9664; PREV | <a href="/helion/openstack/">&#9650; UP</a> | <a href="/helion/openstack/faq/">NEXT &#9654; </a></p>
-->
# HP Helion OpenStack&reg; Cloud OS Host Linux Architecture

HP Helion OpenStack Host Linux (Debian-based) project standardizes and controls our operating system environment for OpenStack services by combining Linux elements from `Debian.org`, `Kernel.org`, and foreign sources, to support our CI/CD processes.  

The Host Linux repository provides a base Linux image for use by HP Helion OpenStack (Helion) teams to package and build undercloud and overcloud nodes.

* [Service Description and Purpose](#description)
* [Host Linux Repository](#repo)
* [Service Architecture](#servicearch)
* [Components](#components)
* [Interfaces](#interfaces)
* [Data](#data)
* [Dependencies](#dependencies)
* [Sequence Diagrams](#sequence)
* [Implementation](#implement)

## Service Description and Purpose ## {#description}

Host Linux is an HP-controlled, HP-internal only, Open Source Software Repository derived from the Debian GNU/Linux distribution and is tailored to support HP Helion OpenStack product versions and OpenStack. 

Host Linux is instantiated as a binary and source code repository, which is available to HP Helion OpenStack and constituent HP development partners to create Host Linux operating system images as required for their specific and numerous product requirements. 

Host Linux is the host operating system for HP Helion OpenStack Community edition and HP Helion OpenStack. 

Host Linux runs on physical servers (bare metal) to support the Helion stack, and is used to build images executing virtual OpenStack and Helion services, Host Linux also supports TripleO (OpenStack-on-OpenStack) install, start-up, and operations. 

Host Linux is internal and HP-use-only at this time, delivered to customers as a component of HP Helion OpenStack and HP Helion OpenStack Community.

## Host Linux Repository ## {#repo}

This section describes how Host Linux repository integrates `Debian.org`, `Kernel.org`, and foreign sources. The repository allows partners to select any current or archived packages, as needed.

The packages in the repository are refreshed with each HP Helion OpenStack release. 

Benefits of using the Host Linux repository instead of the `Debian.org`, `Kernel.org`, and foreign sources include:

* The packages are more stable
* The packages are optimized to work with HP Helion OpenStack
* The repository is more secure and provides a smaller attack surface

### Debian.org ###

The HP Helion OpenStack Host Linux repository contains a focused set of 576 Debian packages, Host Linux re-branded. The `Debian.org` repository contains approximately 65,000 packages. 


### Kernel.org ### 

The HP Helion OpenStack Host Linux repository contains the full set of 6 `Kernel.org` packages, optimized to work with HP Helion OpenStack, including kernel parameter tuning, removal of modules not required by Helion, and added drivers.

### Foreign Packages

The HP Helion OpenStack Host Linux repository contains 8 non-Debian packages and 10 Debian packages.

These packages provide required HP Helion OpenStack support not provided in OpenStack.


## Service Architecture  ## {#servicearch}

The following diagram represents the Host Linux service architecture.

<img src="media/LinuxServiceArch_resize2.png"> 

<a href="javascript:window.open('/content/documentation/media/LinuxServiceArch_resize1.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">View larger image</a> (opens in a new window)

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


## Components ## {#components}

debian.org

* Community run FLOSS distribution
* An operating system composed of free software mostly carrying the GNU General Public License.The operating system is developed by an internet collaboration of volunteers.
* Accessible globally via Debian Mirrors


kernel.org

* A main repository of source code for the Linux kernel


WWW

* FLOSS not found in Debian, but available on the Web.
* Requested by HP cloud developers


seedy.fc.hp.com

* Mirrors Debian, providing a local Debian mirror for use within the HP Intranet.

hlinux-incoming.usa.hp.com

* Used to download and assemble packages:
	* Mirror Debian "testing", a subset of the Debian Distribution. (also a few other Debian packages as needed)
	* Download and create custom builds of Linux Kernel
	* Download and package other software outside of Debian on request
* Re-branding of packages
* Validation


hlinux-deejay.usa.hp.com

* Generate index files
	* Repo signing
	* Generate package checksums
* Validation
* Organize & present as Host Linux "repo"


hlinux-hrepo.usa.hp.com

* Used by developers to access the Host Linux repo
* Fetches packages from deejay as needed 


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>




## Interfaces ## {#interfaces}

1. `seedy.fc.hp.com` connects to an official Debian mirror site.

	a. Access Control: none (hp proxy is needed to access internet)
	b. Protocol: HTTP/FTP
	c. Authenticity is ensured via the Debian public key used to validate the repository manifest, and by checksums on the Debian packages held therein.
	d. Timing: Changes pulled 4x each day.

2. `hlinux-incoming.usa.hp.com` connects to `seedy.fc.hp.com`.

	a. Access Control: none
	b. Protocol: HTTP/FTP
	c. Authenticity is ensured via the Debian public key used to validate the repository manifest, and by checksums on the Debian packages held therein.
	d. Timing: Changes are pulled 1x each week, or needed for bug/security updates

3. `hlinux-incoming.usa.hp.com` connects to `kernel.org`.

	a. Access Control: none (hp proxy is needed to access internet)
	b. Protocol: HTTPS
	c. Authenticity is ensured via 3rd party certificate authority (HTTPS) and by checksums on the Kernel downloads.
	d. Timing: Changes are pulled as needed, generally following Debian release schedule ~2x per month, or as needed for bug/security updates

4. `hlinux-incoming.usa.hp.com` connects to various software download locations on the internet. 

	a. Access Control: none? (hp proxy is needed to access internet)
	b. Protocol: HTTP/HTTPS/FTP
	c. Authenticity is ensured via 3rd party certificate authority (HTTPS)  and by checksums on downloads WHEN AVAILABLE.
	d. Timing: Change pulls are driven by cloud team requesting the software.

5. `(a) hLinux-deejay.usa.hp.com` connects to `hlinux-incoming.usa.hp.com`; `(b) hlinux-incoming.usa.hp.com` connects to `hLinux-deejay.usa.hp.com`.

	a. Access Control: username/password -or- secure key
	b. Protocol: SSH, SFTP
	c. Authenticity is ensured via the Debian public key used to validate the repository manifest, and by checksums on the Debian packages held therein.
	d. Timing: Packages are pushed when they have changed, in response to downloads and kernel builds.

6. `hlinux-hrepo.usa.hp.com` connects to `hLinux-deejay.usa.hp.com`.

	a. Access Control: none
	b. Protocol: HTTP
	c. Authenticity is ensured via the HP public key used to validate the repository manifest, and by checksums on the hLinux packages held therein.
	d. Timing: Packages are pulled in response to requests initiated by HP Cloud Engineers

7. HP Cloud Engineers connect to `hlinux-hrepo.usa.hp.com`

	a. Access Control: none
	b. Protocol: HTTP
	c. Authenticity is ensured via the HP public key used to validate the repository manifest, and by checksums on the hLinux packages held therein.
	d. Timing: Packages are requested as needed.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


## Data ## {#data}

<table style="text-align: left; vertical-align: top; width:650px;">
<tr style="background-color: #C8C8C8;">
<th>Data name</th>
<th>Confidentiality</th>
<th>Integrity</th>
<th>Availability</th>
<th>Backup?</th>
<th>Description</th>
</tr>
<tr>
<td>Linux packages</td>
<td>Public</td>
<td>High</td>
<td>Low</td>
<td>No</td>
<td>Cinder DB store configuration management data</td>
</tr>
<tr>
<td>Foreign objects</td>
<td>Public</td>
<td>High</td>
<td>Low</td>
<td>No</td>
<td>Session tokens are stored.</td>
</tr>
<tr>
<td>HP value-added objects</td>
<td>Restricted</td>
<td>High</td>
<td>Low </td>
<td>No </td>
<td></td>	 
</tr>
<tr>
<td>Pool packages</td>
<td>Restricted</td>
<td>High</td>
<td>Low</td>
<td>No</td>
<td>Objects in the pool, organized in filesystem directories: main, contrib, non-free</td>
</tr>
<tr>
<td>Distro index</td>
<td>Restricted</td>
<td>High</td>
<td>Low</td>
<td>No</td>
<td>A hierarchy of links to objects forming releases</td>
</tr>
<tr>
<td>Releases</td>
<td>Restricted</td>
<td>High</td>
<td>Low</td>
<td>No</td>
<td>Named, non-experimental Linux releases such as Jessie, Cattleprod, Wheezy</td>
</tr>
<tr>
<td>Playlists</td>
<td>Restricted</td>
<td>High</td>
<td>Low</td>
<td>No</td>
<td>A playlist is a representation of a specific release's contents</td>
</tr>
</table>

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


## Dependencies ## {#dependencies}

* Kernel.org
* Debian.org

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

## Sequence Diagrams ## {#sequence} 

**Chain of Custody**

The following diagram represents the Host Linux chain of custody.

<img src="media/LinuxCustodyChain.png">

<a href="javascript:window.open('/content/documentation/media/LinuxCustodyChain75.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">View larger image</a> (opens in a new window)

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


## Implementation ## {#implement}

**The Implementation architecture diagram**

The following diagram represents the Host Linux implementation architecture.

<img src="media/LinuxImplementArch50.png">

<a href="javascript:window.open('/content/documentation/media/LinuxImplementArch.png','_blank','toolbar=no,menubar=no,resizable=yes,scrollbars=yes')">View larger image</a> (opens in a new window)


All hardware is identical:

**HP DL360 Gen8**

* 2x Intel Xeon processors with 8 cores each (+HT)
	256Gb of memory

* 3.2 TB of storage (8x 600Gb SFF HDs in RAID 5)
* 4x 1Gb NICs


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*


---
layout: default
title: "HP Helion OpenStack&#174; FAQ"
permalink: /helion/openstack/ga/faq/
product: commercial

---
<!--UNDER REVISION-->

<p style="font-size: small;"> <a href="/helion/openstack/release-notes/">&#9664; PREV</a> | <a href="/helion/openstack/">&#9650; UP</a> | <a href="/helion/openstack/technical-overview/">NEXT &#9654;</a> </p>

#HP Helion OpenStack&#174; FAQ#

Welcome! You've got questions. We have the answers.  

##Understanding HP Helion OpenStack

* [What is HP Helion OpenStack?](#whatHelion)
* [What does HP Helion OpenStack beta enable me to do?](#distroenable)
* [What is TripleO?](#TripleO)
* [What is a Seed?](#whatisseed)  
* [What is the Undercloud?](#whatisundercloud) 
* [What is the Overcloud?](#whatisovercloud) 
* [What is available in the beta version announced on June 30th?](#preview)
* [Is the release localized for non-English speaking markets?](#localized) 
* [Does the HP Helion OpenStack work with hybrid or public cloud projects?](#hybridorpubliccloud)
* [How many nodes and virtual machines does it support?](#nodes)  
* [How can I update the software?](#softwareupdate)
* [Does it include an Operating System (OS)?](#includeOS)
* [Does this distribution include the OpenStack Icehouse release?](#icehouse) 
* [Can HP Helion OpenStack run on non-HP hardware?](#nonhphardware)

##Support and additional resources  

* [Are HP support services included with HP Helion OpenStack?](#supportservices)
* [What support options are available?](#supportoptions)
* [Where can I find more information?](#MoreInfo)
* [Where can I report issues with HP OpenStack Helion?](#reportissues) 

####What is HP Helion OpenStack? #### {#whatHelion}

It is a scaled out, hardened and curated commercial-grade product designed to deliver the best open source cloud computing technology in a resilient, maintainable platform. 

<!-- Removed per Gary's comments I HP Helion OpenStack is the first OpenStack distribution from HP. It is free to download and will be kept updated frequently to stay current with OpenStack developments. It is the foundational technology for all HP Helion products in the future.-->

####What does HP Helion OpenStack beta enable me to do? #### {#distroenable}

You have consistently given us feedback to release a distribution of OpenStack technology - fully tested, hardened and supported by HP. With this version, you can deploy a cloud configuration with an out-of-the-box experience for a 20 to 30 node cloud environment.  

<!-- Removed per JR's comments The final version of this free distribution enables you to evaluate OpenStack and to deploy small-scale private clouds in production (up to 30 nodes). They will be able to do this more quickly and easily with HP's simplified installation and update mechanisms.-->

<!-- #### Removed per Gary's comments I How does HP Helion OpenStack compare to other OpenStack distributions on the market? #### {#howcompare}

HP Helion OpenStack is one of the first distributions in the market, based on up-to-date code from the OpenStack community. It is derived from pure OpenStack and open source technologies, configured and packaged by HP. For example, TripleO, which is used for installation and update, is the official OpenStack project for deployment.-->
 
<!--#### Removed as per JR's comments Is there a cost associated with this distribution? #### {#distrocost} 

It is free to download. An optional support package will be available to purchase from HP for access to HP OpenStack technical support.  
--> 

####What is TripleO? #### {#TripleO}

OpenStack on OpenStack, or TripleO, is OpenStack's official project for deployment of OpenStack systems. It builds on the core resource-provisioning strengths of OpenStack technology. It enables you to administrate your cloud, and deploy and maintain virtual and baremetal installations of OpenStack using the same APIs you are familiar with for deploying workloads on an OpenStack cloud. A template based deployment engine (using OpenStack Heat) allows for rigorous testing and reliable, repeatable deployments of known configurations.

A TripleO installation includes a Seed, the Undercloud and the Overcloud.
 
####What is a Seed? #### {#whatisseed}  

A Seed VM is a bootable KVM VM image provided as part of HP Helion OpenStack and is deployed in a VM instance. This image contains the minimum services required of OpenStack to function and to be able to provision physical hardware to deploy the Undercloud. The services are Nova, Neutron, Glance, Keystone, Ironic & Heat.

This is the first phase of the HP Helion OpenStack installation.

####What is the Undercloud? #### {#whatisundercloud} 

The Undercloud server is a basic, single-node, OpenStack installation running on a single physical server used to deploy, test, manage, and update the overcloud servers. There is no HA configuration for the Undercloud. 

It contains a strictly limited sub-set of OpenStack, just enough to interact with the Overcloud. The services running on Undercloud are Nova, Neutron, Glance, Keystone, Ironic, Heat, Horizon & Ceilometer. This server also contains HP Helion content distribution catalog  service, which provides a mechanism to download and install content and updates for the Overcloud.

The Undercloud also hosts images for various server types which will form the functional cloud environment - the Overcloud. These images are Overcloud Controller, Overcloud Compute, Overcloud Swift & Overcloud Compute Proxy (required for cloud which supports VMWare ESX as a hypervisor).

This is the second phase of the HP Helion OpenStack installation. 

####What is the Overcloud? #### {#whatisovercloud}

The Overcloud is the functional cloud available to run guest virtual machines and workloads. It offers access to Nova, Neutron, Glance, Keystone, Cinder, Swift, Ironic, Heat, Horizon, and Ceilometer services.  

Setting up the Overcloud completes the overall Helion Openstack installation process. 

####What is available in the beta version announced on June 30th? #### {#preview}

On June 30th, we announced a preview of HP Helion OpenStack that enables you to deploy an OpenStack TripleO-based cloud experience and evaluate the Icehouse release of OpenStack.  

It is available with support for baremetal deployments (up to 30 Compute nodes). We plan to release new versions roughly every six weeks.

<!--
####When can I expect support for baremetal deployment? #### {#baremetal}

<font color="red">Support for baremetal deployment for a small scale private cloud deployment is available with this release.</font> 
(Removed per Gary's suggestion.) 
-->

####Is the release localized for non-English speaking markets? #### {#localized}

No. The 2014 release is English only.

####Does HP Helion OpenStack work with hybrid or public cloud projects? #### {#hybridorpubliccloud}

No. Currently, HP Helion OpenStack beta is supported by HP for small-scale, private cloud deployments only.

####How many nodes and virtual machines does it support? #### {#nodes}

HP Helion OpenStack beta will support up to 30 nodes and 40 VMs per node. 

<!--In the final release, it will support scalable deployments of thousands of compute nodes supporting tens of thousands of VMs. This has been tested and proven using the best practices developed by HP over the past three years running OpenStack public cloud services at scale.-->
  
####How can I update the software? #### {#softwareupdate}

We provide automated, live distribution of updates.

####Does it include an Operating System (OS)? #### {#includeOS}

Yes. It includes an integrated Linux&#174; host OS hardened and tested for this distribution.

###Does this distribution include the OpenStack Icehouse release? #### {#icehouse}

Yes, and we are one of the first vendors to release a supported, productized distribution based on Icehouse, [HP Helion OpenStack Community](/helion/community/). 

####Can HP Helion OpenStack run on non-HP hardware? #### {#nonhphardware}

Yes, provided the hardware meets the minimum specification. We will continue to work with you to develop a list of third-party hardware on which the distribution is known to run.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

##Support and additional resources  

####Are HP support services included with HP Helion OpenStack? #### {#supportservices}

<!--No. An optional paid support contract from HP will be made available for purchase soon.--> 

In the next release, we hope to deliver full life-cycle services to help you from strategy through design, implementation, support and education. 

####What support options are available? #### {#supportoptions}

Foundation Care 8x5 support is included, providing additional support levels including same day and 24x7 coverage.

HP Support provides access to experts in [HP's Global Cloud Center of Excellence](http://h20427.www2.hp.com/campaign/hp-cloud-centre-of-excellence/ap/en/index.html) as a single source of support and accountability, which also qualifies you for indemnification.
<!--
HP Helion OpenStack will be covered by Foundation Care Operations support at an additional cost, which will be available in the near future. You would be able to interact with experts in [HP's Global Cloud Center of Excellence](http://h20427.www2.hp.com/campaign/hp-cloud-centre-of-excellence/ap/en/index.html) as a single source of support and accountability.

You have access to:   	
* HP OpenStack technical experts, tools and best practices 
* HP Helion OpenStack edition software support
* Installation advisory support
* Help with software features and operational support
-->

####Where can I find more information? #### {#MoreInfo}

* [HP Helion OpenStack Portal](http://www8.hp.com/us/en/cloud/hphelion-openstack.html)
* [HP Helion OpenStack Documentation](https://docs.hpcloud.com/helion/openstack/) 
<!--* [HP Helion OpenStack Support Forum](https://ask.openstack.org/en/questions/scope:all/sort:activity-desc/tags:hphelion) (Tag your questions with 'HPHelion')-->

####Where can I report issues with HP Helion OpenStack? #### {#reportissues}

To report issues with HP Helion OpenStack, please visit the [HP Support Center](http://us-support.external.hp.com/portal/site/hpsc/public).  

<!-- removed per JR's comment I We are hosting the support discussion forum for the edition at [https://ask.openstack.org](https://ask.openstack.org).  Developers in the community are very familiar with this forum and already participate in OpenStack-related discussions there. Please tag your questions with 'HPHelion' to get our attention for any questions and issues you raise.--> 
<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*

<!--

####Does the distribution include non-OpenStack tools? #### {#nonopenstack}

No. HP Helion OpenStack is a pure distribution that leverages OpenStack standards coupled with HP Virtual Cloud Networking (VCN) application and ESX support.

[When can I expect support for bare metal deployment?](#baremetal)

####Is HP Helion OpenStack integrated with other HP Helion products and solutions? #### {#integrated}

Yes. These products will reference "Powered by HP OpenStack."

-->

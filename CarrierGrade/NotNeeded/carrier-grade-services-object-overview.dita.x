<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE topic
  PUBLIC "-//OASIS//DTD DITA Topic//EN" "http://docs.oasis-open.org/dita/v1.1/OS/dtd/topic.dtd" ><topic xml:lang="en-us" id="topic3419">
<title>HP Helion <tm tmtype="reg">OpenStack</tm> Carrier Grade 1.1: Object Storage (Swift) Service Overview</title>
<prolog>
<metadata>
<othermeta name="layout" content="default"/>
<othermeta name="product-version" content="HP Helion Openstack"/>
<othermeta name="product-version" content="HP Helion Openstack 1.0"/>
<othermeta name="product-version" content="HP Helion Openstack 1.0.1"/>
<othermeta name="product-version" content="HP Helion Openstack 1.1"/>
<othermeta name="role" content="Storage Administrator"/>
<othermeta name="role" content="Storage Architect"/>
<othermeta name="role" content="Ranjan J, Keshava HP, Sameer V, Jayme P, Binamra S"/>
<othermeta name="product-version1" content="HP Helion Openstack"/>
<othermeta name="product-version2" content="HP Helion Openstack 1.0"/>
<othermeta name="product-version3" content="HP Helion Openstack 1.0.1"/>
<othermeta name="product-version4" content="HP Helion Openstack 1.1"/>
</metadata>
</prolog>
<body>
<p>
<!--UNDER REVISION-->
 <!--./CarrierGrade/ServicesOverviews/carrier-grade-services-object-overview.md-->
 <!--permalink: /helion/openstack/carrier/services/object/overview/--></p>
<!-- modeled after HP Cloud Networking Getting Started (network.getting.started.md) -->
<p>HP Helion <tm tmtype="reg">OpenStack</tm> introduces integral, built-in support for <xref href="../../CarrierGrade/AdminGuideNew/Swift/carrier-grade-services-scale-out-swift.dita" >Scale-out Object Storage (Swift)</xref> to the cloud.
The HP Helion <tm tmtype="reg">OpenStack</tm> cloud deployment includes automatic creation of a Swift cluster and starter nodes. It also enables SSL automatically to secure the data transmission.</p>
<p>Based on <tm tmtype="reg">OpenStack</tm> Swift, the HP Helion <tm tmtype="reg">OpenStack</tm> object storage service provides a highly available, resilient, and scalable storage pool for unstructured data.</p>
<section id="architecture-overview"> <title>Architecture Overview</title>
<p>At its core, Object Storage (Swift) is built from a set of software services and data constructs hosted on a cluster of servers.</p>
<!--
A Swift cluster is software defined storage (SDS) architecture layered on top of industry standard servers using standard storage drives. -->
<p>A Object Storage (Swift) cluster is Software Defined Storage (SDS) architecture, layered on top of industry standard servers, using native storage devices which are typically disk drives.</p>
<p>
<b>Note</b>: It is not recommended to run Swift on top of other systems (hardware or software) that hide the failure domains or native storage devices like using RAID group on top of drives.</p>
<p>The services in the Swift cluster are either <b>
<i>access</i>
</b> services or <b>
<i>storage</i>
</b> services.</p>
<ul>
<li>The <i>access</i> services group is made up of the Swift Proxy Servers, which run Swift-Proxy, Account and Container Services, HTTP/HTTPS load balancers, and <tm tmtype="reg">OpenStack</tm> Keystone authentication service.</li>
<li>The <i>storage</i> services group is composed of Swift Object Servers and various background services such as replicators.  </li>
</ul>
<p>Each service group can be scaled <b>
<i>independently</i>
</b> to meet workload and redundancy requirements. The storage service can be scaled up as necessary (<xref href="../../CarrierGrade/AdminGuideNew/Swift/carrier-grade-services-scale-out-swift.dita" >scale-out Swift</xref>). It can also be horizontally scalable to handle an increased number of simultaneous connections as well as large number of objects.</p>
</section>
<section id="expanding-the-object-storage-swift-deployment"> <title>Expanding the Object Storage (Swift) Deployment</title>
<p>Note that the initial installation of Helion <tm tmtype="reg">OpenStack</tm> cloud includes the creation and configuration of a basic two-node Starter All-in-one Swift deployment. Any additional rings, nodes or servers are expansions of this basic installation.</p>
<p>For more information and in-depth diagrams, see <xref href="../../CarrierGrade/AdminGuideNew/Swift/carrier-grade-services-scale-out-swift.dita" >About Scale-Out Object Storage (Swift)</xref>.</p>
<ol>
<li>Deploy Object Storage (Swift) starter nodes<!--A BR tag was used here in the original source.--><i>(completed as part of the HP Helion <tm tmtype="reg">OpenStack</tm> cloud deployment)</i>
</li>
<li>Scale up or expand 

<ul>
<li>
<xref href="../../CarrierGrade/AdminGuideNew/Swift/carrier-grade-services-swift-deployment.dita" >Deploy New Object Storage (Swift)</xref>
</li>
<li>
<xref href="../../CarrierGrade/AdminGuideNew/Swift/carrier-grade-services-swift-deployment-provision-swift-node.dita" >Add New Storage Servers</xref>
</li>
<li>
<xref href="../../CarrierGrade/AdminGuideNew/Swift/carrier-grade-services-swift-deployment-expand-swift-cluster.dita" >Extend a Object Storage (Swift) Cluster</xref>
</li>
<li>
<xref href="../../CarrierGrade/AdminGuideNew/Swift/carrier-grade-services-swift-deployment-add-disk-storage-node.dita" >Add a New Scale-out Object Node</xref>
</li>
<li>
<xref href="../../CarrierGrade/AdminGuideNew/Swift/carrier-grade-services-swift-deployment-add-proxy-node.dita" >Add a New Scale-out Proxy Node</xref>
</li>
<li>
<xref href="../../CarrierGrade/AdminGuideNew/Swift/carrier-grade-services-swift-deployment-add-disk-scale-out-object-ring.dita" >Add a Disk to a Scale-out Object Ring</xref>
</li>
<li>
<xref href="../../CarrierGrade/AdminGuideNew/Swift/carrier-grade-services-swift-deployment-add-disk-account-container.dita" >Add a Disk to an Account and Container Ring</xref>
</li>
<li>
<xref href="../../CarrierGrade/AdminGuideNew/Swift/carrier-grade-services-swift-deployment-add-disk-starter-object-ring.dita" >Add a Disk to the Starter Object Ring</xref>
</li>
</ul>
</li>
<li>Shrink or scale down

<ul>
<li>
<xref href="../../CarrierGrade/AdminGuideNew/Swift/carrier-grade-services-swift-deployment-shrink-remove-exisitng-disk.dita" >Remove a disk from an Object Node</xref>
</li>
<li>
<xref href="../../CarrierGrade/AdminGuideNew/Swift/carrier-grade-services-swift-deployment-shrink-remove-proxy-node.dita" >Remove a Proxy Node</xref>
</li>
<li>
<xref href="../../CarrierGrade/AdminGuideNew/Swift/carrier-grade-services-swift-deployment-shrink-remove-scale-out-object-storage-node.dita" >Removing a scale-out Object Storage Node</xref>
</li>
</ul>
</li>
<li>Monitor</li>
</ol>
<ul>
<li>
<xref href="../../CarrierGrade/AdminGuideNew/Swift/carrier-grade-services-swift-deployment-monitor-swift-disk.dita" >Monitor Disk Usage</xref>
</li>
<li>
<xref href="../../CarrierGrade/AdminGuideNew/Swift/carrier-grade-services-swift-deployment-monitor-replica-swift-status.dita" >Replication Status using Icinga</xref>
</li>
<li>
<xref href="../../CarrierGrade/AdminGuideNew/Swift/carrier-grade-services-swift-deployment-monitor-health-check.dita" >Service Health Check</xref>
</li>
<li>
<xref href="../../CarrierGrade/AdminGuideNew/Swift/carrier-grade-services-swift-deployment-monitor-health-swift-services.dita" >Check Health Services</xref>
</li>
<li>
<xref href="../../CarrierGrade/AdminGuideNew/Swift/carrier-grade-services-swift-deployment-monitor-swift-proxy-health-checks.dita" >Object Storage (Swift) Proxy Health Check</xref>
</li>
<li>
<xref href="../../CarrierGrade/AdminGuideNew/Swift/carrier-grade-services-swift-deployment-monitor-swift-network-interface.dita" >Network Interface Card</xref>
</li>
<li>
<xref href="../../CarrierGrade/AdminGuideNew/Swift/carrier-grade-services-swift-deployment-monitor-swift-mount-points.dita" >Mount Points</xref>
</li>
<li>
<xref href="../../CarrierGrade/AdminGuideNew/Swift/carrier-grade-services-swift-deployment-monitor-disk-drive(s).dita" >Disk Drives</xref>
</li>
<li>
<xref href="../../CarrierGrade/AdminGuideNew/Swift/carrier-grade-services-swift-deployment-monitor-swift-network-access-ping.dita" >Network Access (Ping)</xref>
</li>
<li>
<xref href="../../CarrierGrade/AdminGuideNew/Swift/carrier-grade-services-swift-deployment-monitor-swift-drive-audit.dita" >Drive Audit</xref>
</li>
<li>
<xref href="../../CarrierGrade/AdminGuideNew/Swift/carrier-grade-services-swift-deployment-monitor-swift-file-ownership.dita" >File Ownership</xref>
</li>
</ul>
<p>
  <xref type="section" href="#topic3419"> Return to Top </xref>
</p>
<!-- ===================== horizontal rule ===================== -->
</section>
</body>
</topic>

---
layout: default-devplatform
permalink: /als/v1/admin/cluster/cloud-init/
product: devplatform
---
<!--PUBLISHED-->

cloud-init[](#cloud-init "Permalink to this headline")
=======================================================

[cloud-init](https://help.ubuntu.com/community/CloudInit) (the Ubuntu
package for handling early initialization of cloud instances) can be
used to provide additional flexibility when configuring Application Lifecycle Service cluster
nodes, and can simplify joining a cluster and assigning roles.

cloud-init can be configured at instance launch time by pasting YAML
directly into the OpenStack Horizon interface.

For example, given a core node at IP 10.2.3.4, the following
cloud-config would add a new DEA node to the cluster:

    #cloud-config

    helion:
      nats:
        ip: 10.2.3.4
      roles: ['dea']
      extname: "paas.example.com" 

-   `nats:ip` will run
    `kato attach <nats ip>` the first time the VM is
    booted.
-   `extname` when supplied with a fully qualified
    domain name will run `kato rename <extname>` on
    the instance first boot.
-   Roles takes a list of roles to configure the node with. For guidance
    on how to work with roles see
    [*Roles*](index.html#server-cluster-roles).

Securing the new node[](#securing-the-new-node "Permalink to this headline")
-----------------------------------------------------------------------------

To lock down and secure this new node, you could use standard cloud-config directives for adding any SSH keys, randomizing passwords, and/or disabling password based authentication entirely. An example that creates a data services node, enables passwordless sudo for the admin group, and disables password based authentication:

    #cloud-config

    helion:
      nats:
        ip: 10.2.3.4
      roles: ['data-services']

    chpasswd:
     list: |
       helion:RANDOM
       root:RANDOM
       ubuntu:RANDOM
     expire: false
    ssh_pwauth: false

    bootcmd:
    - - cloud-init-per
      - once
      - sudo_admin_group_nopasswd
      - sed
      - -ri
      - s|^%admin .*|%admin ALL=\(ALL\) NOPASSWD:ALL|
      - /etc/sudoers

Custom System Configuration[](#custom-system-configuration "Permalink to this headline")
-----------------------------------------------------------------------------------------

In addition to the Application Lifecycle Service node configuration tasks described above,
cloud-init can be used for a variety of system setup tasks:

-   adding custom apt sources
-   setting apt mirrors
-   running arbitrary commands at boot
-   setting up chef, puppet, salt-stack, or MCollective
-   setting the locale and time zone
-   resizing the root filesystem to take up all available space, making
    it easy to grow a snapshot
-   set passwords
-   configure ssh keys

For more information on cloud-init, refer to the [official CloudInit
documentation](https://help.ubuntu.com/community/CloudInit).
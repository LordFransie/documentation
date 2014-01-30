---
layout: default
title: "UNIX CLI DNS Examples"
permalink: /cli/unix/dns/
product: unix-cli

---
# UNIX CLI DNS Examples

___________________

###Important Notice###

On November 4, 2013, the UNIX CLI was moved into its End-of-Life Cycle process toward final deprecation. During this 6-month transition time:

* New and existing customers are encouraged to migrate to the OpenStackClient (Unified) CLIs or the OpenStack command-line clients for each respective service
* No new feature requests will be honored
* Bug reports will be accepted

After 6-months, you will still have access to online resources, but HP Cloud will not offer support and the software download will be disabled. HP Cloud has contributed the Unix CLI back to the open source community, and you can access the source code, documentation, and downloads [here](https://github.com/hpcloud/unix_cli).

_________________________________________

This page gives you a few examples of how to perform various DNS tasks using the HP Cloud service.

Remember that you can get detailed help for any command or task with the following command:

    $ hpcloud help <TASK>

##DNS Commands## {#DNSCommands}

To list available DNS domains:

    $ hpcloud dns
      +----------+---------------+------+------------+------------------------+----------------------------+
      | id       | name          | ttl  | serial     | email                  | created_at                 |
      +----------+---------------+------+------------+------------------------+----------------------------+
      | 1fd06e78 | cliadd2.com.  | 3600 | 1367352840 | clitestadd@example.com | 2013-04-29T01:26:11.000000 |
      | 8b455585 | cliadd3.com.  | 3600 | 1367264795 | clitestadd@example.com | 2013-04-29T19:37:09.000000 |
      +----------+---------------+------+------------+------------------------+----------------------------+

To add a DNS domain:

    $ hpcloud dns:add cliadd4.com. clitestadd@example.com
    Created dns 'cliadd4.com.' with id '2f663a95'.

To add a DNS record to a domain:

    $ hpcloud dns:records:add cliadd4.com. www.cliadd4.com. A 100.1.1.1
    Created dns record 'www.cliadd4.com.' with id '80852df3'.

To list DNS records:

    $ hpcloud dns:records cliadd4.com.
      +----------+------------------+------+-----------+----------------------------+
      | id       | name             | type | data      | created_at                 |
      +----------+------------------+------+-----------+----------------------------+
      | 80852df3 | www.cliadd4.com. | A    | 100.1.1.1 | 2013-05-03T14:54:29.000000 |
      +----------+------------------+------+-----------+----------------------------+

To remove a DNS record:

    $ hpcloud dns:records:remove cliadd4.com. www.cliadd4.com.
    Removed DNS record 'www.cliadd4.com.'.

To remove a DNS domain:

    $ hpcloud dns:remove cliadd4.com.
    Removed dns 'cliadd4.com.'.



---
layout: default
title: "UNIX CLI for HP Helion Public Cloud: Advanced Account Management"
permalink: /cli/unix/2/account-management/
product: unix-cli

---
<!--PUBLISHED-->
#UNIX CLI for HP Helion Public Cloud v13.5: Advanced Account Management

If you are using v12.12, click [here](https://docs.hpcloud.com/cli/unix/account-management) for documentation.
___________________

###Important Notice###

On November 4, 2013, the UNIX CLI was moved into its End-of-Life Cycle process toward final deprecation. During this 6-month transition time:

* New and existing customers are encouraged to migrate to the OpenStackClient (Unified) CLIs or the OpenStack command-line clients for each respective service
* No new feature requests will be honored
* Bug reports will be accepted

HP Helion Public Cloud has contributed the Unix CLI back to the open source community, and you can get support, access the documentation, and download the source code [here](https://github.com/hpcloud/unix_cli).

_________________________________________

This page discusses the following topics:

* [Account Providers for Migration](#Providers)
* [Updating Account Availability Zones](#ChangingAvailabilityZones)
* [Updating Account Credentials](#ModifyingAccountCredentials)
* [Updating Account Options](#ModifyingAccountOptions)


## Account Providers for Migration ## {#Providers}

Use the `-p` provider option to the `account:setup` command to create accounts for cloud providers other than HP.  These accounts are only supported for the purposes of migration; e.g., to create an account to migrate files from a Google object storage container, run:

    $ hpcloud account:setup goog -p google

## Updating Account Availability Zones ## {#ChangingAvailabilityZones}

Use the `account:edit` command to change the availability zones/regions for a particular service.  The `account:edit` command requires two arguments: `account_name` and one or more `name_value_pairs`.

To change the default zone of the object storage and CDN to `region-b`, run:

    $ hpcloud account:edit hp 'object storage=region-b.geo-1' 'cdn=region-b.geo-1'

To change the availability zone of the compute service from its current setting to availability zone 2 for account `account2`, run:

    $ hpcloud account:edit account2 'compute=az-2.region-a.geo-1'

To display the active availability zones for your services, use the `account:catalog` command as follows:

    $ hpcloud account:catalog account2

Or log into the [console](https://horizon.hpcloud.com/) and select `Manage Access Keys` from the project menu.

## Updating Account Credentials ## {#ModifyingAccountCredentials}

Use the `account:edit` command to change any of the following account credentials:

* `account_id` - account id (access key) or user name
* `secret_key` - secret key or password
* `project_id` - project identifier also known as tenant identifier
* `auth_uri` - authorization URI
* `userpass` - true for user name/password false or not set for access key secret key

The `account:edit` requires two arguments: `account_name` and the `name_value_pair`.

To change the project id for account `hp`, run:

    $ hpcloud account:edit hp project_id=xxxxxxxxxxxxx     

## Updating Account Options ## {#ModifyingAccountOptions}

Use the `account:edit` command to change any of the following account options:

* `connect_timeout *seconds*`
* `read_timeout *seconds*`
* `write_timeout *seconds*`
* `ssl_verify_peer *true/false*`
* `ssl_ca_path *file_path*` 
* `ssl_ca_file *file_name*` 
* `preferred_flavor *flavor id* `
* `preferred_image *image id*`

The `account:edit` requires two arguments: `account_name` and `name_value_pair`.

To change the connection timeout value for account `hp`, run:

    $ hpcloud account:edit hp connect_timeout=40



## Account Providers for Migration ## {#Providers}

Use the `-p` provider option to the `account:setup` command to create accounts for cloud providers other than HP.  These accounts are  supported solely for migration; e.g., to create an account to migrate files from Google object storage container, run:

    $ hpcloud account:setup goog -p google

## Updating Account Availability Zones ## {#ChangingAvailabilityZones}

Use the `account:edit` command to change the availability zones for a particular service.  The `account:edit` requires two arguments: `account_name` and one or more `name_value_pairs`.

To change the availability zone of the object storage and CDN to region b, run:

    $ hpcloud account:edit hp 'object storage=region-b.geo-1' 'cdn=region-b.geo-1'

To change the availability zone of the compute service from its current setting to AZ2 for the account `account2`, run:

    $ hpcloud account:edit account2 'compute=az-2.region-a.geo-1'

To display the active availability zones for your services, through the [HP Helion Public Cloud Console](https://horizon.hpcloud.com). Click the project menu and select *Roles and API Endpoints*. 

## Updating Account Credentials ## {#ModifyingAccountCredentials}

Use the `account:edit` command to change any of the following account credentials:

* `account_id` 
* `secret_key`
* `auth_uri`
* `tenant_id`

The `account:edit` requires two arguments: `account_name` and the `name_value_pair`.

To change the access key for the `hp` account:

    $ hpcloud account:edit hp tenant_id=xxxxxxxxxxxxx     

## Updating Account Options ## {#ModifyingAccountOptions}

Use the `account:edit` command to change any of the following account options:

* `connect_timeout *seconds*`
* `read_timeout *seconds*`
* `write_timeout *seconds*`
* `ssl_verify_peer *true/false*`
* `ssl_ca_path *file_path*` 
* `ssl_ca_file *file_name*` 
* `preferred_flavor *flavor id* `
* `preferred_image *image id*`

The `account:edit` requires two arguments: `account_name` and the `name_value_pair`.

To change the connection timeout value for the `hp` account, run:

    $ hpcloud account:edit hp connect_timeout=40


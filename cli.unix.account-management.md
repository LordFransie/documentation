---
layout: default
title: "UNIX CLI for HP Cloud: Advanced Account Management"
permalink: /cli/unix/account-management/
product: unix-cli

---
#UNIX CLI for HP Cloud: Advanced Account Management v12.12

___________________

###Important Notice###

On November 4, 2013, the UNIX CLI was moved into its End-of-Life Cycle process toward final deprecation. During this 6-month transition time:

* New and existing customers are encouraged to migrate to the OpenStackClient (Unified) CLIs or the OpenStack command-line clients for each respective service
* No new feature requests will be honored
* Bug reports will be accepted

HP Cloud has contributed the Unix CLI back to the open source community, and you can get support, access the documentation, and download the source code [here](https://github.com/hpcloud/unix_cli).

_________________________________________

This page discusses the following topics:

* [Account Providers for Migration](#Providers)
* [Updating Account Availability Zones](#ChangingAvailabilityZones)
* [Updating Account Credentials](#ModifyingAccountCredentials)
* [Updating Account Options](#ModifyingAccountOptions)

## Account Providers for Migration ## {#Providers}

You may use the `-p` provider option to the account:setup command to create accounts for cloud providers other than HP.  These accounts are only supported for the purposes of migration.  For example, to create an account to migrate files from Google object storage container:

    $ hpcloud account:setup goog -p google

## Updating Account Availability Zones ## {#ChangingAvailabilityZones}

You can use the `account:edit` command to change the availability zones for a particular service.  The `account:edit` requires two arguments: `account_name` and one or more `name_value_pairs`.

To change the availability zone of the object storage and CDN to region b:

    $ hpcloud account:edit hp storage_availability_zone=region-b.geo-1 cdn_availability_zone=region-b.geo-1

To change the availability zone of the compute service from its current setting to AZ2 for the account `account2`:

    $ hpcloud account:edit account2 compute_availability_zone=az-2.region-a.geo-1

To display the active availability zones for your services, You can find the values for these variables through the [HP Helion Public Cloud Console](https://horizon.hpcloud.com). Click the project menu and select *Roles and API Endpoints*.  

## Updating Account Credentials ## {#ModifyingAccountCredentials}

You can use the `account:edit` command to change any of the following account credentials:

* `account_id` 
* `secret_key`
* `auth_uri`
* `tenant_id`

The `account:edit` requires two arguments: `account_name` and the `name_value_pair.

To change the access key for the `hp` account:

    $ hpcloud account:edit hp tenant_id=xxxxxxxxxxxxx     

## Updating Account Options ## {#ModifyingAccountOptions}

You can use the `account:edit` command to change any of the following account options:

* `connect_timeout *seconds*`
* `read_timeout *seconds*`
* `write_timeout *seconds*`
* `ssl_verify_peer *true/false*`
* `ssl_ca_path *file_path*` 
* `ssl_ca_file *file_name*` 
* `preferred_flavor *flavor id* `
* `preferred_image *image id*`

The `account:edit` requires two arguments: `account_name` and the `name_value_pair.

To change the connection timeout value for the `hp` account:

    $ hpcloud account:edit hp connect_timeout=40


##Related topics

* [Installation](/cli/unix/install)
* [Account Configuration](/cli/unix/configuration)
* [Compute Examples](/cli/unix/compute)
* [Object Storage Examples](/cli/unix/object-storage)
* [CDN Examples](/cli/unix/cdn)
* [Block Storage Examples](/cli/unix/block-storage)
* [Volume Management](/block-storage/volume)
* [DNS Examples](/cli/unix/dns)
* [CLI Reference](/cli/unix/reference)

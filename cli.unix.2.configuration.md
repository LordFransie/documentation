---
layout: default
title: "Unix CLI for HP Helion Public Cloud: Account Configuration"
permalink: /cli/unix/2/configuration/
product: unix-cli
published: false

---
<!--PUBLISHED-->
# Unix CLI for HP Helion Public Cloud v13.5: Account Configuration

If you are using v12.12, click [here](https://docs.hpcloud.com/cli/unix/configuration) for documentation.
___________________

###Important Notice###

On November 4, 2013, the UNIX CLI was moved into its End-of-Life (EOL) Cycle process toward final deprecation. Please be aware that this does not mean that the UNIX CLI is "going away", but simply that HP Helion Public Cloud is relinquishing its ownership of this CLI and, instead, making it available on the [HPCloud Github](https://github.com/hpcloud/unix_cli) repository. We encourage existing customers to consider migrating to the OpenStackClient (Unified) CLIs. As such, during this 6-month transition timeframe, HP Helion Public Cloud will be dedicating engineering efforts around the OpenStackClient CLI as the primary Unified CLI of choice for development around your OpenStack cloud services.

We wanted to ensure you were aware of the changes that may affect you during this 6-month transition time:

+ The UNIX CLI has moved to the HP Helion Public Cloud Github repository

  + In order to encourage development by the community, HP Helion Public Cloud is sharing it with the community as open source, hosted on [https://github.com/hpcloud/unix_cli](https://github.com/hpcloud/unix_cli).
 
  + However, [links to 12.12 and 13.5 UNIX CLI downloads](#downloads), and all documentation, are still currently available on docs.hpcloud.com, as usual.

+ Bugs will be addressed

  + Although the CLI has moved into the open source community, showstoppers and significant defects will be examined and addressed by the HP Helion Public Cloud SDK/CLI team on a case-by-case basis.

HP Helion Public Cloud has contributed the Unix CLI back to the open source community, and you can get support, access the documentation, and download the source code [here](https://github.com/hpcloud/unix_cli).
_________________________________________

This page discusses account setup on HP Helion Public Cloud using the UNIX Command Line Interface (CLI) for the following tasks:

* [Account Setup](#AccountSetup)
* [Account Edit](#EditAccount)
* [List Accounts](#ListAccounts)
* [Display Credentials for an Account](#DisplayCredsforAccount)
* [Copy an Account](#CopyAccount)
* [Assigning an Account as Default](#AssigningDefault)
* [Remove an Account](#RemoveAccount)
* [Specifying an Account for a Single Operation](#DefiningAccountsPerCommand)
* [Specifying an Availability Zone for a Single Operation](#DefiningAZsPerCommand)

Get detailed help for any command/task by running: 

   `hpcloud help` <TASK>

## Account Setup ## {#AccountSetup}

**Note: During a new configuration, you must supply the access key, secret key, and tenant ID assigned during the registration process; You can find the values for these variables through the [HP Helion Public Cloud Console](https://horizon.hpcloud.com). Click the project menu and select *Manage Access Keys* and *Account Info*.  You can also define the availability zone during the initial setup.**

To begin account setup, run:

    `account:setup` 
    
and supply values at the prompts to create or modify an account.



## Edit Account ## {#EditAccount}
To edit the account, run 
      `account:edit` 

Running this command with no arguments prompts you for information like the `account:setup` command above did, but for editing purposes. Current values are shown by default. Hit return if you want to accept the current settings at each prompt.

However, if, for example, you want to change the storage availability zone for the `hp` account, specify the `account_name` and `name_value_pairs`, as arguments to the `account:edit` command as follows: 

   `account:edit hp 'object storage=region-b.geo-1`

## List Accounts ## {#ListAccounts}
To view all your current accounts, run 

    [`account:list`](/cli/unix/2/reference#account):
    hp <= default
    account_1
    my_account_3

## Display Credentials for an Account ## {#DisplayCredsforAccount}
To view a specific account&#039;s credentials, for example, run
the [`account <account_name>`](/cli/unix/2/reference#account) command.

    $ hpcloud account account_1
    credentials:
      account_id: '229721xxxxxxx'
      secret_key: EueAi5RxxxxxxxxxUXAotdYDluP
      auth_uri: https://region-a.geo-1.identity.hpcloudsvc.com:35357/v2.0/
      tenant_id: '6642xxxxxxxx05'
    :regions: 
      :"object storage": region-c.geo-1
      :cdn: region-a.geo-1
      :compute: az-1.region-a.geo-1
      :"block storage": az-1.region-a.geo-1
    options: {}

### Copy an Account ### {#CopyAccount}
To copy an existing account to a new account use the `account:copy <source_account_name> <new_account_name>` command.  This command will also overlay an existing account:

    $ hpcloud account:copy hp account_2 
    Account 'hp' copied to 'account_2'

## Assigning an Account as Default ## {#AssigningDefault}
When you execute a CLI command without designating a specific account with the *-a* option, the default account is used. You can redefine the default account by using the [`account:use <account_name>`](/cli/unix/2/reference#account:use) command:

    $ hpcloud account:use account_2
    Account 'account_2' is now the default

## Verify an Account ## {#VerifyAccount}
To verify an existing account, use the [`account:verify <account_name>`](/cli/unix/2/reference#account:verify) command:

    $ hpcloud account:verify account_2
    Verifying 'account_2' account...
    Connected to 'account_2' successfully

## Remove an Account ## {#RemoveAccount}
To remove an existing account, use the [`account:remove <account_name>`](/cli/unix/2/reference#account:remove) command:

    $ hpcloud account:remove account_2
    Removed account 'account_2'

## Specifying an Account for a Single Operation ## {#DefiningAccountsPerCommand}
You can specify an account name for a single command line operation and it does not affect your account's base credentials. To run a command on an account other than the default account use the `-a` option.

To show the servers on `account2` rather than the default, run:

   $ hpcloud servers -a account2

Most commands allow you to use the `-a` option; see the [UNIX CLI Reference page](/cli/unix/2/reference) to determine if a particular command supports the option.

## Specifying an Availability Zone for a Single Operation ## {#DefiningAZsPerCommand}
You can specify an availability zone for a single command line operation without affecting your account's base credentials and quickly perform an operation in another availability zone not specified in your profile. To run a command on a different availability zone, use the `-z` option.  You can see the regions you are activated in with the `hpcloud account:catalog` command.

To view servers using the `region-b.geo-1` availability zone:

   $ hpcloud servers -z region-b.geo-1
   
Most commands allow you to use the `-z` option; see the [UNIX CLI Reference page](/cli/unix/2/reference) to determine if a particular command supports the option.

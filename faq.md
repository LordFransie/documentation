---
layout: default
title: "HP Helion Public Cloud FAQ"
permalink: /faq/
product: public-cloud

---
# HP Helion Public Cloud FAQ

What is a web site without an FAQ or two?  Well, a pain in the neck to use, honestly; that's why we've tried to provide you with a comprehensive one here.  If you have any suggestions on additions or improvements to our little effort here, please let us know on the forums!



<!--reference ruby fog and unix cli to install pages

after uninstalling, you can install a new gem from [wherever]-->



For your edification and delectation, we have FAQs in the following areas:



* [UNIX CLI](#UnixCLI)

* [Ruby Fog Bindings](#RubyFogBindings)



## UNIX CLI## {#UnixCLI}

___________________

###Important Notice###

On November 4, 2013, the UNIX CLI was moved into its End-of-Life Cycle process toward final deprecation. During this 6-month transition time:

* New and existing customers are encouraged to migrate to the OpenStackClient (Unified) CLIs or the OpenStack command-line clients for each respective service
* No new feature requests will be honored
* Bug reports will be accepted

HP Helion Public Cloud has contributed the Unix CLI back to the open source community, and you can get support, access the documentation, and download the source code [here](https://github.com/hpcloud/unix_cli).

_________________________________________


The questions we address in the UNIX CLI section of this FAQ are:



* [How do I install or upgrade HP Helion Public Cloud Unix CLI?](#HowdoIinstallHPCloudUnixCLI)

* [How do I get help with HP Helion Public Cloud Unix CLI?](#HowdoIgethelpwithHPCloudUnixCLI)

* [How do I diagnose a problem with the CLI?](#HowdoIDebugHPCloudUnixCLI)

* [How do I install HP Helion Public Cloud Unix CLI without RVM?](#HowdoIinstallHPCloudUnixCLIwithoutRVM)

* [How do I uninstall HP Helion Public Cloud Unix CLI?](#HowdoIuninstallHPCloudUnixCLI)

* [What if these FAQs didn't answer my questions?](#WhereelsecanIgoformoreinformationUnixCLI)



### How do I install or upgrade HP Helion Public Cloud Unix CLI?### {#HowdoIinstallHPCloudUnixCLI}



Please surf on over to the [installation page](/cli/unix/2/install) for full installation information.



### How do I get help with HP Helion Public Cloud Unix CLI?### {#HowdoIgethelpwithHPCloudUnixCLI}



You can get a list of commands at any time by calling the hpcloud command without any arguments:



    hpcloud



Each command has help built in which includes specific examples of use, aliases you can use and more. To see help for a specific command use:



    hpcloud help <command>



Where `command` is the command for which you want help.  If you want to check which version of the tool you have installed:



    hpcloud info



### How do I diagnose problems with the HP Helion Public Cloud Unix CLI?### {#HowdoIDebugHPCloudUnixCLI}

 

There is an article that covers how to run the HP Helion Public Cloud Unix CLI with [verbose debugging output](/cli/unix/articles/debugging).

 

 

### How do I install HP Helion Public Cloud Unix CLI without RVM?### {#HowdoIinstallHPCloudUnixCLIwithoutRVM}



If you choose not to use RVM, you must install the [gem](/glossary#gem) as a super user.



### How do I uninstall HP Helion Public Cloud Unix CLI?### {#HowdoIuninstallHPCloudUnixCLI}



To uninstall the UNIX CLI, all you have to do is run the uninstall command:



    gem uninstall hpcloud



### Where else can I go for more information?### {#WhereelsecanIgoformoreinformationUnixCLI}



Plenty of places!  You might consider starting with the [UNIX CLI documentation](/cli/unix) itself.  If what you're looking for isn't there, you can also try [our community forums](https://community.hpcloud.com/).  


##Ruby Fog Bindings## {#RubyFogBindings}



The questions we address in the Ruby Fog bindings section of this FAQ are:



* [How do I install HP Helion Public Cloud Ruby Fog?](#HowdoIinstallHPCloudRubyFog)

* [How do I install HP Helion Public Cloud Ruby Fog without RVM?](#HowdoIinstallHPCloudRubyFogwithoutRVM)

* [How do I upgrade HP Helion Public Cloud Ruby Fog?](#HowdoIupgradeHPCloudRubyFog)

* [How do I uninstall HP Helion Public Cloud Ruby Fog?](#HowdoIuninstallHPCloudRubyFog)

* [What if these FAQs didn't answer my questions?](#WhereelsecanIgoformoreinformationRubyFog)



### How do I install HP Helion Public Cloud Ruby Fog?### {#HowdoIinstallHPCloudRubyFog}



Please surf on over to the [installation page](/bindings/fog/install) for full installation information.



### How do I install HP Helion Public Cloud Ruby Fog without RVM?### {#HowdoIinstallHPCloudRubyFogwithoutRVM}



If you choose not to use RVM, you must install all required dependencies before you install the HP Helion Public Cloud Ruby Fog [gem](/glossary#gem).



<!--link to nokogiri package and install information?-->



### How do I upgrade HP Helion Public Cloud Ruby Fog?### {#HowdoIupgradeHPCloudRubyFog}



To upgrade HP Helion Public Cloud Ruby Fog, you first must uninstall the gem and then install the new gem:



    gem uninstall hpfog

    gem install $(wget -q --no-check-certificate -O - https://docs.hpcloud.com/sites/default/files/downloads/hpfog_3.tar | tar -xvzf -)



### How do I uninstall HP Helion Public Cloud Ruby Fog?### {#HowdoIuninstallHPCloudRubyFog}



To uninstall Ruby Fog, all you have to do is run the uninstall command:



    gem uninstall hpfog



### Where else can I go for more information?### {#WhereelsecanIgoformoreinformationRubyFog}



Plenty of places!  You might consider starting with the [Ruby Fog documentation](/bindings/fog) itself.  If what you're looking for isn't there, you can also try [our community forums](https://community.hpcloud.com/). 



<!--I need the HTML for launching a support chat window-->



<!--

## Installation



## Deployment



## Windows CLI

-->

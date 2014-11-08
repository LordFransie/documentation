---
layout: default
title: "Connecting to the HP Helion Public Cloud"
permalink: /v13/bindings/fog/connect/
product: fog
published: false

---
<!--PUBLISHED-->
#Ruby Fog Bindings for HP Helion Public Cloud: Connecting to the HP Helion Public Cloud

This page gives you details on how to connect to the HP Helion Public Cloud and contains the following sections:

* [Initial Connection](#InitialConnection)
* [Supplying Your Credentials](#SupplyingyourCredentials)
* [Availability Zones](#AvailabilityZones)
* [Optional Parameters](#OptionalParameters)

##Initial Connection## {#InitialConnection}

To connect to the HP Helion Public Cloud, follow these steps:

1. Enter IRB

        irb

2. Require the Fog library and Rubygems:

        require 'rubygems'
        require 'fog'
        
    **Note**: If the `require 'rubygems'` command returns a value of `false`, enter IRB with the following command:
    
        irb -r 'rubygems'

3. Establish a connection to the desired service

        conn = Fog::<SERVICE-NAME>.new(
               :provider      => "HP", 
               :version => :v2,
               :hp_access_key  => "<your_ACCESS_KEY>",
               :hp_secret_key => "<your_SECRET_KEY>",
               :hp_auth_uri   => "<IDENTITY_ENDPOINT_URL>",
               :hp_tenant_id => "<your_TENANT_ID>",
               :hp_avl_zone => "<your_AVAILABILITY_ZONE>",
               <other optional parameters>
               )

Where `SERVICE-NAME` can be [Compute](/bindings/fog/compute), [Storage](/bindings/fog/object-storage), or [CDN](/bindings/fog/cdn). Please surf on over to the [Block Storage page](/bindings/fog/block-storage) for the details on how to connect to that service.

**Note**: You must use the `:hp_access_key` parameter rather than the now-deprecated  `:hp_account_id` parameter you might have used in previous Ruby Fog versions.

You can find the values the access key, secret key, and other values through the [HP Helion Public Cloud Console](https://horizon.hpcloud.com). Click the project menu and select *Roles and API Endpoints*.


##Availability Zones## {#AvailabilityZones}

You cannot specify an availability zone if you have not activated it.  To activate an availability zone, go to the [Management Console dashboard](https://console.hpcloud.com/) and click the `**Activate`** button.  You are required to set an availability zone to establish a connection; there is no default availability zone value.

The current usable availability zones for the compute service:

* `region-a.geo-1`
* `region-b.geo-1`

The current usable availability zones for the storage service:

* `region-a.geo-1`
* `region-b.geo-1`

The current usable availability zones for the CDN:

* `region-a.geo-1`
* `region-b.geo-1`

The current usable availability zones for the block storage service:

* `region-a.geo-1`
* `region-b.geo-1`

##Optional Parameters## {#OptionalParameters}

This section describes the optional parameters that you can use when connecting to any of the services.  The examples below show the Compute service, but these optional parameters work with all of the available HP Helion Public Cloud services.

The `user_agent` parameter allows you to specify a string to pass as a `user_agent` header for the connection.  You can use this to track the caller of the operations.  You can set the `user_agent` parameter as follows:

        conn = Fog::Compute.new(
               ...
               ...
               :user_agent => "MyApp/x.x.x")

This inserts a `user_agent` string such as `hpfog/x.x.x (MyApp/x.x.x)` into the header.

In addition to the `user_agent` parameter, there are several additional parameters you can set using the `connection_options` parameter.  These options are provided by the Excon library and allow you to modify the underlying connection to a service.  These options are [Instrumentation](#Instrumentation), [Timeouts](#Timeouts), [Proxy](#Proxy), and [HTTPS/SSL](#HTTPS).

###Instrumentation### {#Instrumentation}

Use this parameter for debugging purposes.  When you use the basic parameter `Excon::StandardInstrumentor`, all events are output to `stderr`.  You can also designate your own instrumentor.  You can set the instrumentation parameter as follows:

        conn = Fog::Compute.new(
               ...
               ...
               :connection_options => {:instrumentor => Excon::StandardInstrumentor})

###Timeouts### {#Timeouts}

Use this parameter to set different timeout values.  You can set the timeouts parameter as follows:

        conn = Fog::Compute.new(
               ...
               ...
               :connection_options => {
                      :connect_timeout => <time_in_secs>, 
                      :read_timeout => <time_in_secs>, 
                      :write_timeout => <time_in_secs>})

###Proxy### {#Proxy}

Use this parameter to specify a proxy URL for both  HTTP and HTTPS connections.  You can set the proxy parameter as follows:

        conn = Fog::Compute.new(
               ...
               ...
               :connection_options => {:proxy => 'http://myproxyurl:4444'})
               
###HTTPS/SSL### {#HTTPS}

By default, peer certificates are verified when you use secure socket layer (SSL) for HTTPS.  Sometimes this does not work due to configurations in different operating systems, causing connection errors. To help avoid this, you can set  HTTPS/SSL parameters.  To set the path to the certificates:

        conn = Fog::Compute.new(
               ...
               ...
               :connection_options => {:ssl_ca_path => "/path/to/certs"})
             
To set the path to a certificate file:

        conn = Fog::Compute.new(
               ...
               ...
               :connection_options => {:ssl_ca_file => "/path/to/certificate_file"})

To set turn off peer verification:

        conn = Fog::Compute.new(
               ...
               ...
               :connection_options => {:ssl_verify_peer => false})

**Note**: This makes your connection less secure.

For further information on these options, please see [the Excon documentation](http://github.com/geemus/excon).

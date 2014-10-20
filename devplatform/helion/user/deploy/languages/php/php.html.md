---
layout: default-devplatform
permalink: /als/v1/user/deploy/languages/php/
---
<!--PUBLISHED-->

#Developing In PHP
Whether you're deploying an application to the HP Helion Development Platform, a
Cloud Foundry based Platform as a Service (PaaS), or writing applications that take
advantage of HP Helion OpenStack® to manage infrastructure or software services, tools
to enable successful development are available in PHP.

For more information on working with object storage, 
see the [HP Helion OpenStack® Object Storage Service Overview](/helion/openstack/services/object/overview/).

For more information on authentication, see [Identity Service, Authentication, and the Service Catalog](/als/v1/user/deploy/languages/php/authentication/).

##Application Lifecycle Services
Application Lifecycle Service (ALS) provides a means to execute PHP applications on a managed platform, controlling application lifecycle through a PaaS tier. Deploying
applications to this platform is as easy as adding details to a YAML configuration file and using
a console application to push the application to ALS.
At its simplest form, the configuration file *manifest.yml*, which is located at the root of a project, 
would look like:
<div class="highlight-none"><div class="highlight"><pre>name: php-web-app
framework:
    type: php
</pre></div>
</div>
This will set the ALS framework type for a PHP web application.

To create a worker non-http application set the web process to <strong>null</strong> (~) and specify
the command to <strong>run</strong>. For example:
<div class="highlight-yaml"><div class="highlight"><pre><span class="l-Scalar-Plain">name</span><span class="p-Indicator">:</span> <span class="l-Scalar-Plain">php-app</span>
<span class="l-Scalar-Plain">framework</span><span class="p-Indicator">:</span> <span class="l-Scalar-Plain">php</span>
<span class="l-Scalar-Plain">command</span><span class="p-Indicator">:</span> <span class="l-Scalar-Plain">php worker.php</span>
<span class="l-Scalar-Plain">processes</span><span class="p-Indicator">:</span>
    <span class="l-Scalar-Plain">web</span><span class="p-Indicator">:</span> <span class="l-Scalar-Plain">~</span>
</pre></div>
</div>
Management of the deployed application and its services happens through a web application or
a console application. To learn more see the [manifest.yml](als/v1/user/deploy/manifestyml/) reference</a>.


Deployment[](#deployment "Permalink to this headline")
-------------------------------------------------------

You will need at least two files to deploy a PHP app on Application Lifecycle Service:
*index.php*, and *manifest.yml*.

The *manifest.yml* must specify **php** as the framework type:

    framework:
            type: php

For more information, see the [manifest.yml](als/v1/user/deploy/manifestyml/) reference.

Application URL[](#application-url "Permalink to this headline")
-----------------------------------------------------------------

Some applications require the user to specify the APP\_URL. Below is an
example on how to obtain the correct urls:

    $appinfo = getenv("VCAP_APPLICATION");
    $appinfo_json = json_decode($appinfo,true);
    $admin = $appinfo_json['uris'][0];

Worker Applications[](#worker-applications "Permalink to this headline")
-------------------------------------------------------------------------

Non-HTTP apps that run as an Application Lifecycle Service application under the control of
the Health Manager.

To deploy worker applications, you need to use the
[*command*](/als/v1/user/deploy/manifestyml/#command) key and set the
[*proceses: web*](als/v1/user/deploy/manifestyml/#web)
key to Null ("\~").

### Example[](#example "Permalink to this headline")

    name: php-app
    framework: php
    command: php worker.php
    processes:
      web: ~

Database Services[](#database-services "Permalink to this headline")
---------------------------------------------------------------------

### [DATABASE\_URL](/als/v1/user/services/data-services/#database-url/)

Authentication details for your configured database services can be
found in the **$\_SERVER** variable, under 
**DATABASE_URL**. Here is a sample for retrieving the correct credentials:

    <?php
        $url_parts = parse_url($_SERVER['DATABASE_URL']);
        $db_name = substr( $url_parts['path'], 1 );
        $db_connection_string = $url_parts['host'] . ':' . $url_parts['port'];

        // ** MySQL settings from resource descriptor ** //
        echo $db_name;
        echo $url_parts['user'];
        echo $url_parts['pass'];
        echo $url_parts['host'];
        echo $url_parts['port'];
    ?>

### [VCAP\_SERVICES](/als/v1/user/services/data-services/#vcap-services/)

    <?php
        $services = getenv("VCAP_SERVICES");
        $services_json = json_decode($services,true);
        $mysql_config = $services_json["mysql"][0]["credentials"];

        // ** MySQL settings from resource descriptor ** //
        echo $mysql_config["name"];
        echo $mysql_config["user"];
        echo $mysql_config["password"];
        echo $mysql_config["hostname"];
        echo $mysql_config["port"];
        );
    ?>

PHP.ini[](#php-ini "Permalink to this headline")
-------------------------------------------------

Additional PHP ini files will be loaded from the
`$HELION_APP_ROOT/apache/php/` directory. Refer to
the example below for more information.

Document Root Access[](#document-root-access "Permalink to this headline")
---------------------------------------------------------------------------

If your document root (the location of the main *index.php* file) is the
main application directory, the information stored in 
*manifest.yml* is exposed to the browser.

To prevent exposing this information, you can use an *.htaccess* file in
the document root directory with the following rule:

    <filesmatch "^(manifest)\.yml$">
      order allow,deny
      deny from all
    </filesmatch>

Alternatively, move your application into a subdirectory (e.g. move
*index.php* to *www/index.php*) and explicitly set your document-root in
*manifest.yml*:

    framework:
      document-root: www

Using the *.htaccess* file will generate an "HTTP 403 Forbidden" error
if a user tries to access the denied files. Changing the document-root
will generate an "HTTP 404 Not Found" error instead.

These techniques can be use to hide other files in your application
source tree which you do not want exposed to end users.

SERVER\_NAME & SERVER\_PORT[](#server-name-server-port "Permalink to this headline")
-------------------------------------------------------------------------------------

Application Lifecycle Service serves web applications port 80 and/or 443 at the router, but
within the application container Apache will be running on a different
port. PHP will report this internal IP address and port in the
SERVER\_ADDR and SERVER\_PORT Apache environment variables respectively.

If your application makes use of these variables, you may need to adjust
them by using an [.htaccess
file](http://httpd.apache.org/docs/current/howto/htaccess) to set
one or more
[RewriteRule](http://httpd.apache.org/docs/current/mod/mod_rewrite.html#rewriterule)
directives to correct the server name or port in URLs.

Persistent Sessions (PHP)[](#persistent-sessions-php "Permalink to this headline")
-----------------------------------------------------------------------------------

One of the issues with managing a PHP application running multiple
instances is dealing with user sessions.

If your application uses a [*shared filesystem
service*](/als/v1/user/services/filesystem/#persistent-file-system), you
can store user sessions there. The following *manifest.yml* snippet
creates a persistent filesystem service, creates a directory for
sessions, and writes a PHP config file to set the path to the session
directory:

    services:
      ${name}-fs: filesystem
    hooks:
      post-staging:
      - mkdir -p "$HELION_FILESYSTEM"/sessions
      - echo "session.save_path = $HELION_FILESYSTEM/sessions" > "$HELION_APP_ROOT"/apache/php/sessions.ini

For better performance, use a
[*Memcached*](/als/v1/user/services/memcached/#memcached) service for
session storage instead:

    services:
      ${name}-cache: memcached
    hooks:
      post-staging:
      - echo "session.save_handler = memcached" > "$HELION_APP_ROOT"/apache/php/sessions.ini
      - echo "session.save_path = $MEMCACHE_URL" >> "HELIONO_APP_ROOT"/apache/php/sessions.ini

####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
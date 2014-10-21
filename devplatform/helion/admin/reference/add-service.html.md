---
layout: default-devplatform
permalink: /als/v1/admin/reference/add-service/
product: devplatform
---
<!--PUBLISHED-->

Adding System Services[](#adding-system-services "Permalink to this headline")
===============================================================================

Application Lifecycle Service has two Service definitions:

-   System Services: Service types (e.g. MySQL, RabbitMQ, Filesystem)
    available for use on the system
-   Provisioned Services: Instances of the System Services created for
    end user applications

The [*helion
services*](/als/v1/user/reference/client-ref/#command-services)
command will show a list of all System Services available on the current
target, as well as a list of Provisioned Services allocated to the
authenticated user.

Administrators can configure external data services to work in the same
way as core Application Lifecycle Service System Services, exposing existing software and
infrastructure for use by Application Lifecycle Service and its users.


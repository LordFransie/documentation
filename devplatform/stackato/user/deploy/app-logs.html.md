---
layout: default-devplatform
permalink: /als/v1/user/deploy/app-logs/
---
<!--PUBLISHED-->

Application Logs[](#application-logs "Permalink to this headline")
===================================================================

Logs for applications running on Application Lifecycle Service are aggregated into streams
so that data from multiple instances can be viewed together and
filtered. Application log streams can be accessed via:

-   the [*Management Console*](/als/v1/admin/console/customize/#management-console)
    using the **View Logs** button on the application Details page, or
-   the [*helion logs*](/als/v1/user/reference/client-ref/#command-logs)
    command
-   application log [*drains*](#application-logs-drain)

Log streams are tailed output from actual log files in each application
container, which are generally found in the */home/helion/logs/* directory.
These files can be accessed with the [*helion
files*](/als/v1/user/reference/client-ref/#command-files) command or from the
Application details page of the [*Management
Console*](/als/v1/admin/console/customize/#management-console).

**Note**

These files are not automatically rotated. For long-running applications
or verbose logs, you should [*rotate them*](#application-logs-rotate) to
avoid filling up the application container's filesystem.

helion logs[](#helion-logs "Permalink to this headline")
-------------------------------------------------------------

To view an application log stream, use the [*helion
logs*](/als/v1/user/reference/client-ref/#command-logs) command:

    $ helion logs myapp

To limit the number of lines displayed, use the `--num` option:

    $ helion logs myapp --num 50

To view log stream as it is updated, use the `--follow` option:

    $ helion logs myapp --follow

Log streams can be filtered on a number of parameters:

-   **--text** does a glob pattern match on the log message
-   **--instance** shows only logs from the specified application
    instances (starting at instance 0).
-   **--filename** filters based on the log filename (e.g. 'stderr.log')
-   **--source** shows only logs from the specified source ('app' or
    'staging'). Without a source specified, the log stream includes
    staging and application logs as well as cloud events relevant to
    app.

The `--json` flag can be used to return each log
line as a JSON object.

**Note**

`helion logs` buffers only 400 lines of the log
stream history (i.e. lines generated prior to it being run). If you need
earlier log lines, use the [*helion
files*](/als/v1/user/reference/client-ref/#command-files) command to fetch the
relevant log file from the *logs/* directory or create a log
[*drain*](#application-logs-drain) preemptively (where possible).

### Adding Files to the Stream[](#adding-files-to-the-stream "Permalink to this headline")

By default, `helion logs` streams log data from
*staging\_tasks.log* (while staging), *stdout.log* and *stderr.log*
(while running).

You can add up to five additonal files to the log stream by modifying
the **STACKATO\_LOG\_FILES** environment variable (in
[*stackato.yml*](/als/v1/user/deploy/stackatoyml/#stackato-yml-env) or using [*helion
set-env*](/als/v1/user/reference/client-ref/#command-set-env)).

The variable should contain a list of named files separated with ":" in
the following format:

    name=/path/to/file.log:name=/path/to/another.log

The *name* used in the value or individual variable name becomes part of
each log line, and can be used for filtering the stream.

For example, to add a specific Tomcat log file to the default
\$STACKATO\_LOG\_FILES variable, you might set the following in
*stackato.yml*:

    env:
      STACKATO_LOG_FILES: tomcat=/home/helion/tomcat/logs/catalina.2013-11-04.log:$STACKATO_LOG_FILES

Paths can be specified fully or specified relative to \$STACKATO\_APP\_ROOT.

helion drain[](#helion-drain "Permalink to this headline")
---------------------------------------------------------------

The [*helion drain
add*](/als/v1/user/reference/client-ref/#command-drain-add) command is used to
create a log drain which forwards application logs to external log
aggregation services, log analysis tools, or Redis databases. For
example:

    $ helion drain add myapp appdrain udp://logs.loggly.com:12345

This creates a UDP drain called "appdrain" for the application "myapp"
which forwards all log messages and events for that application to
[Loggly](http://loggly.com/) on port 12345.

The log drain URL can contain only:

-   **scheme**: `udp://` or `tcp://`
-   **host**: IP address or hostname
-   **port**: number

Any additional parameters are discarded.

To delete the drain:

    $ helion drain delete appdrain

Use the --json option send the log lines in JSON format:

    $ helion drain add myapp jsondrain --json udp://logs.loggly.com:12346

To check the status of your application drains, use the
`helion drain list` command.

**Note**

If the service at the recieving end of the drain goes offline or becomes
disconnected, Application Lifecycle Service will retry the connection at increasing
intervals.

Log Drain Examples[](#log-drain-examples "Permalink to this headline")
-----------------------------------------------------------------------

Detailed instructions on how to use drains with third party log analysis
software or services:

-   [*Papertrail*](#app-logging-examples-papertrail)
-   [*Loggly*](#app-logging-examples-loggly)
-   [*Splunk*](#app-logging-examples-splunk)

### Papertrail[](#papertrail "Permalink to this headline")

1.  [Create an account for Papertrail](https://papertrailapp.com/plans)
2.  In the Dashboard screen, click *Add Systems*.
    <img src="/content/devplatform/stackato/images/ppt11.png" />
    <img src="/content/devplatform/stackato/images/logo.png" />
 
3.  In the Setup Systems screen under *Other log methods*, click
    *Alternatives*.
    <img src="/content/devplatform/stackato/images/ppt21w.png" />
 
4.  Choose option C: *My system's hostname changes* and give it a
    suitable name.
    <img src="/content/devplatform/stackato/images/ppt31.png" />

5.  Note the **port number**.
    <img src="/content/devplatform/stackato/images/ppt41.png" />

6.  Enable application logging (via udp) by executing the following client command:

    `helion drain add drain-name udp://logs.papertrailapp.com:port#`

### Loggly[](#app-logging-examples-loggly "Permalink to this headline")
Loggly supports JSON format with minor configuration changes as shown below.

1. [Create an account for Loggly](https://app.loggly.com/pricing)
1. Under *Incoming Data* tab, click *Add Input*.
	- 	<img src="/content/devplatform/stackato/images/loggly11.png" />
1. In the Add Input screen:
 	- Choose *Syslog UDP or TCP*
 	- Choose *Combination Log Type*
 	- [Optional] For JSON Logging, Choose UDP or TCP **with Stripe** and enable **JSON Logging**. (for system logs)
 	<img src="/content/devplatform/stackato/images/loggly21.png" />
1.  If we want to accept logs from any Application Lifecycle Service nodes or applications, modify the Allowed Devices section:
 	- Click *Add device*
	<img src="/content/devplatform/stackato/images/loggly31.png" />
 	-   Add IP Address 0.0.0.0/0 when prompted
 	<img src="/content/devplatform/stackato/images/loggly41.png" />
1.  Turn off discovery since we allowed all devices. Also note down the **port number**.
 	<img src="/content/devplatform/stackato/images/loggly51.png" />
1. Run **one** of the following client commands to create the log drain:


    `helion drain add drain-name udp://logs.loggly.com:port#`

    `helion drain add drain-name tcp://logs.loggly.com:port#`

### Splunk[](#splunk "Permalink to this headline")
Splunk supports JSON format without further configuration.

1.  [Set up Splunk Server](http://www.splunk.com/download).
2.  In the welcome screen, click *Add data*
	<img src="/content/devplatform/stackato/images/splunk11.png" />
3.  Under *Choose a Data Source*, click “From a TCP port”. (or UDP)
	<img src="/content/devplatform/stackato/images/splunk21.png" />
4.  In the Add new Source screen:
	-   Select a TCP/UDP port greater than **9999**
	-   Give it a suitable **Source name**.
	-   Set sourcetype to **Manual**
	-   Leave Source Type **empty**
	<img src="/content/devplatform/stackato/images/splunk31.png" />

5.  Run the following client command to create the log drain: 
`helion drain add drain-name udp://splunk-server-address:port#`
OR
helion drain add drain-name tcp://splunk-server-address:port#






### Hello World Custom Drain[](#hello-world-custom-drain "Permalink to this headline")

The command below starts a drain target server on a node, piping to a
local file:

    nc -lk 0.0.0.0 10000 > log-output.txt

As long as that nc command runs, this will funnel logs from all drains
targeting it into the file *log-output.txt*

Run one of the following client commands to create the log drain:


    helion drain add drain-name udp://server-address:port#

OR

    helion drain add drain-name tcp://server-address:port#

Rotating Application Log Files[](#rotating-application-log-files "Permalink to this headline")
-----------------------------------------------------------------------------------------------

Application Lifecycle Service does not automatically rotate application log files in
*/home/helion/logs/*. However, you can add log rotation for these
files yourself using `cron` and
`logrotate`. Programming languages, frameworks, and utilities handle logging
operations in different ways. Check for incompatibilities with
`logrotate` before implementing log rotation scheme using it.

1.  Add a cron key in *stackato.yml* to run `logrotate`. Set STACKATO\_CRON\_INSTANCES to "all" to specify that
    the job should be run in all application instances. For example:

        env:
          STACKATO_CRON_INSTANCES: all
        cron:
          - 0 1 * * * /usr/sbin/logrotate --state /home/helion/app/logrotate-state /home/helion/app/app-logrotate.conf

    The `--state` option must be set because the
    `helion` user does not have permission to
    update the default state file.

2.  Add an *app-logrotate.conf* file to the base directory of your    application to specify which log files to rotate and which
    `logrotate` options to use. For example:

        /home/helion/logs/\*.log {
          daily
          compress
          copytruncate
          dateext
          missingok
          notifempty
          rotate 3
          maxage 7
          size 3M
        }

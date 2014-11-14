---
layout: default
title: "HP Helion OpenStack&#174; Updating the Overcloud"
permalink: /helion/openstack/update/troubleshooting/101/
product: commercial.ga

---
<!--PUBLISHED-->


<script>

function PageRefresh {
onLoad="window.refresh"
}

PageRefresh();

</script>
<!--
<p style="font-size: small;"> <a href="/helion/openstack/">&#9664; PREV | <a href="/helion/openstack/">&#9650; UP</a> | <a href="/helion/openstack/faq/">NEXT &#9654; </a></p>
-->
# HP Helion OpenStack&reg; Update Troubleshooting

<!-- taken from https://git.gozer.hpcloud.net/cgit/hp/tripleo-ansible/tree/Troubleshooting.rst -->

This document describes known issues that you might encounter while updating. To help you resolve these issues, we have provided possible solutions.

* [Retrying failed actions](#retry)
* [Node goes to ERROR state during rebuild](#nodeerror)
* [MySQL CLI configuration file missing](#mysqlmissing)
* [MySQL fails to start upon retrying update](#mysqlfails)
* [MySQL/Percona/Galera is out of sync](#mysqlsync)
* [MySQL "Node appears to be the last node in a cluster" error](#lastnode)
* [SSH Connectivity is lost](#sshlost)
* [Postfix fails to reload](#posfix)
* [Apache2 Fails to start](#apache2)
* [RabbitMQ still running when restart is attempted](#rabbitmq)
* [Instance reported as powering on but the instance is in shutoff state](#shutoff)
* [State drive /mnt is not mounted](#mnt)
* [Ironic intermittently set maintenance mode to True during installation](#ironic)
* [A lock problem occurred in Ironic during update of the undercloud using the Ansible script](#ansible)

## Retrying failed actions ## {#retry}

In some cases, steps might fail as some components might not yet be ready for
use due to initialization times, which can vary based on hardware and volume

In the event that this occurs, two options exist that allows a user to
optionally re-attempt or resume playbook executions.

**Solutions**

1. The Ansible ansible-playbook command option *--start-at-task="TASK NAME"* allows resumption of a playbook when used with the *-l* limit option.

		ansible-playbook --start-at-task="<TASK NAME>" -l

2. The Ansible ansible-playbook command option *--step* allows a user to confirm each task executed by Ansible before it is executed upon.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


## Node goes to ERROR state during rebuild ## {#nodeerror}

This can happen from time to time due to network errors or temporary
overload of the undercloud.

After an error, the `nova list` command shows a node in `ERROR` state.

**Solution**

1. Verify that the  hardware is in working order.

2. Get the image ID of the machine with `nova show`:

		nova show $node_id

3. Rebuild manually:

		nova rebuild $node_id $image_id

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


## MySQL CLI configuration file missing ## {#mysqlmissing}

If the post-rebuild restart fails, it is possible that the MySQL CLI configuration file is missing. <!-- ANSUPDATE-116 -->

**Symptoms:**

* Attempts to access the MySQL CLI command return an error:

		ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: NO)

**Solution:**

1. Verify that the MySQL CLI config file (`.my.cnf`) stored on the state drive is present and has content within the file.  You can do this by executing the following command to display the contents in your terminal:

		sudo cat /mnt/state/root/metadata.my.cnf

2. If the file is empty, run the following command to retrieve the current metadata and update the config files on disk:

		sudo os-collect-config --force --one --command=os-apply-config

3. Verify that the MySQL CLI config file is present in the root user directory by executing the following command:

		sudo cat /root/.my.cnf

4. If the `.my.cnf` file does not exist or is empty, two options exist.

	* Add the following to your MySQL CLI command line:

			--defaults-extra-file=/mnt/state/root/metadata.my.cnf

	* Copy the configuration file from the `/state` directory:

			sudo cp -f /mnt/state/root/metadata.my.cnf /root/.my.cnf

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


## MySQL fails to start upon retrying update ## {#mysqlfails}

If the update was aborted or failed during the update sequence before a single MySQL controller was operational, MySQL will fail to start.

**Symptoms:**

* Update is being re-attempted.

* The following error messages having been observed.

		* msg: Starting MySQL (Percona XtraDB Cluster) database server: mysqld . . . . The server quit without updating PID file (/var/run/mysqld/mysqld.pid)

		* stderr: ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/var/run/mysqld/mysqld.sock' (111)

		* FATAL: all hosts have already failed -- aborting

* Update automatically aborts.


**Solution:**

1. Use `nova list` to determine the IP of the congtrollerMgmt node.

2. SSH into the node:

		ssh heat-admin@$IP

3. Verify MySQL is down by running the MySQL client as root. It _should_ fail:

		sudo mysql -e "SELECT 1"

4. Attempt to restart MySQL in case another cluster node is online. This *should* fail in this error state:

		sudo /etc/init.d/mysql start

	Note: If this command succeeds your cluster should again be operational. No further action is required.

5. Start MySQL back up in single node bootstrap mode:

		sudo /etc/init.d/mysql bootstrap-pxc

	**IMPORTANT:** The `/etc/init.d/mysql bootstrap-pxc` command should only ever be executed when an entire MySQL cluster is down, and then only on the last node to have been shut down.  Running this command on multiple nodes will cause the MySQL cluster to enter a "split brain" scenario, effectively breaking the cluster, which results in unpredictable behavior.

	"Split brain" syndrome occurs when a cluster of nodes is divided into smaller clusters, each of which believes it is the only active cluster. 

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


## MySQL/Percona/Galera is out of sync ## {#mysqlsync}

Helion OpenStack is configured to store all of its state in a multi-node synchronous replication Percona XtraDB Cluster database, which uses Galera for replication. This database must be in sync and have the full complement of servers before updates can be performed safely.

**Symptoms:**

* Update fails with errors about Galera and/or MySQL being "Out of Sync".

**Solution:**

1. Use `nova list` to determine IP of controllerMgmt node:

2. SSH into the node:

		ssh heat-admin@$IP

3. Verify replication is out of sync:

		sudo mysql -e "SHOW STATUS like 'wsrep_%'"

4. Stop MySQL:

		sudo /etc/init.d/mysql stop

5. Verify that MySQL is down by running the MySQL client as root. The command *should* fail:

		sudo mysql -e "SELECT 1"

6. Start controllerMgmt0 MySQL back up in single node bootstrap mode:

		sudo /etc/init.d/mysql bootstrap-pxc

7. On the remaining controller nodes obseved to be having issues, utilize the IP address using `nova list` and login to them.:

		ssh heat-admin@$IP

7. Verify replication is out of sync:

		sudo mysql -e "SHOW STATUS like 'wsrep_%'"

8. Stop MySQL:

		sudo /etc/init.d/mysql stop

9. Verify it is down by running the MySQL client as root. It *should* fail:

		sudo mysql -e "SELECT 1"

10. Start MySQL back up so it attempts to connect to controllerMgmt0:

		sudo /etc/init.d/mysql start

	If restarting MySQL fails, then the database might be out of sync. Consult the MySQL error logs, located at /var/log/mysql/error.log.  In this case, never attempt to restart MySQL with `sudo /etc/init.d/mysql bootstrap-pxc` as it will bootstrap the host as a single node cluster thus worsening what already appears to be a split-brain scenario.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


## MySQL "Node appears to be the last node in a cluster" error ## {#lastnode}

This error occurs when one of the controller nodes does not have MySQL running.

The playbook has detected that the current node is the last running node.
However, based on sequence, the current node should not be the last node.  As a result the error is thrown and update aborted.

**Symptoms:**

* Update failed with error message:

	`Galera Replication - Node appears to be the last node in a cluster - cannot safely proceed unless overridden via single_controller setting - See README.rst`

**Solution:**

1. Run the `pre-flight_check.yml` playbook.  It will attempt to restart MySQL on each node in the `Ensuring MySQL is running` step.  If that step succeeds, you should be able to re-run the playbook and not encounter "Node appears to be last node in a cluster" error.

	If the `pre-flight_check` fails to restart MySQL, you will need to consult the MySQL logs (/var/log/mysql/error.log) to determine why the other nodes are not restarting.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


## SSH Connectivity is lost ## {#sshlost}

Ansible uses SSH to communicate with remote nodes. In heavily loaded, single host virtualized environments, SSH can lose connectivity.  It should be noted that similar issues in a physical environment may indicate issues in the underlying network infrastructure.

**Symptoms:**

* Ansible update attempt fails with the following error:

		fatal: [192.0.2.25] => SSH encountered an unknown error. The output was:
		OpenSSH_6.6.1, OpenSSL 1.0.1i-dev xx XXX xxxx
		debug1: Reading configuration data /etc/ssh/ssh_config
		debug1: /etc/ssh/ssh_config line 19: Applying options for *
		debug1: auto-mux: Trying existing master
		debug2: fd 3 setting O_NONBLOCK
		mux_client_hello_exchange: write packet: Broken pipe
		FATAL: all hosts have already failed - aborting

**Solution:**

* You will generally be able to re-run the playbook and complete the upgrade, unless SSH connectivity is lost while all MySQL nodes are down. 

	See [MySQL fails to start upon retrying update](#mysqlfails) to correct this issue.

* Early Ubuntu Trusty kernel versions have known issues with KVM that can impact SSH connectivity to instances. Test hosts should have a minimum kernel version of 3.13.0-36-generic.

	The update steps, as root, are::

		apt-get update
		apt-get dist-upgrade
		reboot

* If this issue is repeatedly encountered on a physical environment, the network infrastructure should be inspected for errors.

* Similar error messages might occur with long running processes, such as database creation/upgrade steps.  These cases will generally have partial program execution log output immediately before the broken pipe message visible.

	In this case, Ansible and OpenSSH might need to have their configuration files tuned to meet the needs of the environment.

	Consult the Ansible configuration file to see available connection settings `ssh_args`, `timeout`, and `pipelining`.

	See the [ansible/examples/ansible.cfg GitHub](https://github.com/ansible/ansible/blob/release1.7.0/examples/ansible.cfg).

	Because Ansible uses OpenSSH, refer to the ssh_config man page, in paricular the ServerAliveInterval and ServerAliveCountMax options.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


## Postfix fails to reload ## {#posfix}

Occasionally the postfix mail transfer agent will fail to reload because it is not running when the system expects it to be running.

**Symptom:**

The `/var/log/upstart/os-collect-config.log` shows that `service postfix reload`' failed.

**Solution:**

Start postfix:

		sudo service postfix start

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


## Apache2 Fails to start ## {#apache2}

Apache2 requires some self-signed SSL certificates to be put in place. If these certificates have not have been configured yet due to earlier failures in the setup process, the following error displays.

**Error Message:**

    failed: [192.0.2.25] => (item=apache2) => {"failed": true, "item": "apache2"}
    msg: start: Job failed to start

**Symptoms:**

* apache2 service fails to start

* `/etc/ssl/certs/ssl-cert-snakeoil.pem` is missing or empty

**Solution:**

Re-run `os-collect-config` to reassert the SSL certificates:

		sudo os-collect-config --force --one

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


## RabbitMQ still running when restart is attempted ## {#rabbitmq}

There are certain system states that cause RabbitMQ to fail to respond to normal kill signals.

**Symptoms:**

Attempts to start RabbitMQ fail because it is already running.

**Solution:**

Find any processes running as `rabbitmq` on the box, and kill them, forcibly if need be.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


## Instance reported as powering on but the instance is in shutoff state ## {#shutoff}

If Compute attempts to restart an instance when the compute node is not ready, Compute could enter into a state where it determines that an instance is starting when in fact the compute node is down.

**Symptoms:**

* Command `nova list --all-tenants` reports instance(s) with `STATUS == "SHUTOFF"` and task_state `== "powering on"`.

* Instance cannot be pinged.

* No instance appears to be running on the compute node.

* Compute service hangs upon retrieving logs or returns old logs from the previous boot.

* Console session cannot be established.

**Solution:**

On a controller logged in as root, after executing `source stackrc`:

1. Execute `nova list --all-tenants` to obtain instance ID(s)

2. Execute `nova show <instance-id>` on each suspected ID to identify suspected compute nodes.

3. Log into the suspected compute node(s) and execute:

		`os-collect-config --force --one`

4. Return to the controller node that you were logged into previously, and using the instance IDs obtained previously, take the following steps.

5. Execute `nova reset-state --active <instance-id>`

6. Execute `nova stop <instance-id>`

7. Execute `nova start <instance-id>`

8. Once the above steps have been taken in order, you should see the instance status return to ACTIVE and the instance become accessible over the network.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


## State drive /mnt is not mounted ## {#mnt}

In the rare event that something bad happened between the state drive being unmounted and the rebuild command being triggered, the `/mnt` volume on the instance that was being executed upon at that time will be in an unmounted state.

In such a state, pre-flight checks will fail attempting to start MySQL and
RabbitMQ.

**Error Messages:**

* Pre-flight check returns an error similar to:

		failed: [192.0.2.24] => {"changed": true, "cmd": "rabbitmqctl -n rabbit@$(hostname) status"
		stderr: Error: unable to connect to node 'rabbit@overcloud-controller0-vahypr34iy2x': nodedown

* Attempting to manually start MySQL or RabbitMQ return:

		start: Job failed to start

* Upgrade execution returns with an error indicating:

		TASK: [fail msg="Galera Replication - Node appears to be the last node in a cluster - cannot safely proceed unless overridden via single_controller setting - See README.rst"] *** 

**Symptoms:**

* Execution of the `df` command does not show a volume mounted as /mnt.

* Unable to manually start services.

**Solution:**

1. Execute the `os-collect config` which will re-mount the state drive. This command might fail without additional intervention, however it should mount the state drive which is all that is needed to proceed to the next step.

		sudo os-collect-config --force --one

	At this point, the `/mnt` volume should be visible in the output of the `df` command.

2. Start MySQL by executing:

		sudo /etc/init.d/mysqld start

	If MySQL fails to start and you have verified that MySQL is not running on any controller nodes, you will need to identify the *last* node that MySQL was stopped on and consult [MySQL fails to start upon retrying update](#mysqlfails) for guidance on restarting the cluster.

3.  Start RabbitMQ by executing:

		service rabbitmq-server start

	* If `rabbitmq-server` fails to start, the cluster might be down. If this is the case, then the *last* node to be stopped will need to be identified and started before attempting to restart RabbitMQ on this node.

4. Re-execute the pre-flight check, and proceed with the upgrade.

<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>


## Ironic intermittently set maintenance mode to True during installation {#ironic}

This issue can happen during the update of undercloud or overcloud nodes. The update will fail for one or more nodes. <!-- CORE-2082 -->

**Symptoms:**

If the update fails, from undercloud node:

1. Source the stackrc file:
 
		source stackrc 

2. Execute the `nova list` command to determine which Compute node(s) is in an error state. The node will have a status of ERROR.

		nova list

3. Execute the `heat stack-list` command to determine which Heat stack is in an error state. The stack will have a status of `CREATE_FAILED`.

		heat stack-list

3. Execute the `ironic node-list` command to determine which node(s) is in maintenance mode. The stack will have a maintenance of `TRUE`.

		ironic node-list

3. Execute the `ironic node-show` command for the node that is node(s) is in maintenance mode. The stack will have a maintenance of `TRUE`.

		ironic node-show <UUID>

	In the output, check the `last_error` field for an error similar to the following:

		During sync_power_state, max retries exceeded for node 81baacd5-657e-476f-b7ef, node state None does not match expected state

		'None'. Updating DB state to 'None' Switching node to maintenance mode. 


**Solution**

1. Remove the node in maintenance mode using the following command:

		nova node-delete <ID of error node>

2. List the stacks using the following command:

		heat stack-list


3. Delete the stack with the failed Nova node.

		heat stack-delete <ID of failed node>

4. Change the node(s) to false for the maintenance option, using the following command:
		
		ironic node-update <id> replace maintenance=False

## Ironic service cannot be restarted on the undercloud {#ansible}

When performing the upgrade to HP Helion OpenStack 1.0.1 using the Ansible-based helper script, the Ironic service cannot be restarted because of a lock situation in Ironic. The update process fails with no specific error message. 

**Symptom**

* A message similar to the following appears in the `ironic-api.log` file:

		2014-10-23 23:03:51.302 31612 WARNING wsme.api [-] Client-side error: Node c241b0d5-abe1-4219-883c-e8dbaf1c5b35 is locked by host hLinux, please retry after the current operation is completed.
		Traceback (most recent call last):
	
	The file is located at: `/var/log/upstart/ironic-api.log`. Search for `locked by host hLinux`.

**Solution**

Workaround when this happens is:

1. Execute the following command in the undercloud:

		mysql --defaults-file=/mnt/state/root/metadata.my.cnf --socket /var/run/mysqld/mysqld.sock ironic -e 'update nodes set reservation=NULL where reservation="hLinux";'

2. Change the **Instance** status from `Error` to `Active`.

		nova reset-state --active <instance ID>

3. Start the server manually or use the following command: 

		nova stop/nova start

4. Execute the update process again.

## A lock problem occurred in Ironic during update of the undercloud using the Ansible script {#ansible}

When performing the upgrade to HP Helion OpenStack 1.0.1 using the Ansible-based helper script, the Ironic service cannot be restarted because of a lock situation in Ironic. The update process fails with no specific error message. <!-- CORE 2043 -->


**Symptom**

* A message similar to the following appears in the `ironic-api.log` file:

		2014-10-23 23:03:51.302 31612 WARNING wsme.api [-] Client-side error: Node c241b0d5-abe1-4219-883c-e8dbaf1c5b35 is locked by host hLinux, please retry after the current operation is completed.
		Traceback (most recent call last):
	
	The file is located at: `/var/log/upstart/ironic-api.log`. Search for `locked by host hLinux`.

**Solution **

Workaround when happen is:

1. Execute the following command in the undercloud:

		mysql --defaults-file=/mnt/state/root/metadata.my.cnf --socket /var/run/mysqld/mysqld.sock ironic -e 'update nodes set reservation=NULL where reservation="hLinux";'

2. Change the **Instance** status from `Error` to `Active`.

		nova reset-state --active <instance ID>

3. Start the server manually or use the following command: 

		nova stop/nova start

4. Execute the update process again.


<a href="#top" style="padding:14px 0px 14px 0px; text-decoration: none;"> Return to Top &#8593; </a>

---
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
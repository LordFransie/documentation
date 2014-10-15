---
layout: default-devplatform
title: "HP Helion Development Platform Workbook Node Database Sample"
permalink: /helion/devplatform/workbook/database/node/
product: devplatform

---
<!--UNDER REVISION-->

# Node MySQL Database Sample

This very simple Node.js app displays the text "Executed query "SELECT "Hello World!"".", and then the result of that query: "Hello World". This is a demonstration of the minimum requirements to build an application that can connect to a MySQL database provided by ALS and run queries against it. Use this sample to ensure that you have set up your environment for connecting to and working with MySQL on the Helion Development Platform. 

This is the **second** sample in the series; if you have not already examined the [HelloWorld](/helion/devplatform/workbook/helloworld/node/) sample, please do that one first.

## Prerequisites
If you are missing any of these items, you will need to [install them](/helion/devplatform/appdev/).

1.	You must have access to an ALS cluster.
2.	The Helion command-line interface (CLI) must be installed.
3.	You must have access to the web-based Helion Management console.

###MySQL

If the MySQL service is not enabled on your cluster, or if you are not sure, follow these steps:

1. Go to the Administrative console for your ALS cluster. <br>For example: *https://api.xx.xx.xx.xx.xip.io*, substitute your own cluster's link.
2. On the **Admin** tab, click **Cluster**.
3. Click the **Settings** icon (a gear icon in the upper right corner)
4. The **MySQL** check box should be checked. If it is not, check it.
5. Click **Save**.

**Note**: If a more durable or scalable MySQL database service is needed, configure your ALS cluster to use a database instance or master/slave pair provided by the Database Service. For more information, refer to [Creating a Database Instance in the Database Service](/helion/devplatform/createdatabase/) and [Connecting the Database Service with ALS](/helion/devplatform/connectdatabase/). 

##Download the Application Files
[Click here to access the download directory.](https://github.com/HelionDevPlatform/helion-mysql-node/)

##Deploy the Application
Use the Helion client to deploy your app to Helion Development Platform.  If you have Eclipse installed, you have the option to use the [deployment plugin](/helion/devplatform/eclipse/).

1.	Open the [Helion command-line interface (CLI)](/als/v1/user/reference/client-ref/)
2.	Ensure that you are logged in to your desired environment.  <br>If you are not, execute `helion login` 
3.	Ensure that you are targeting your desired environment.  <br> If you are not, execute `helion target https://api.xx.xx.xx.xx.example.com`
4.	If you are not already there, `cd` to the root directory of the sample.
5.	Execute `helion push -n`


##Key Code Snippets
	var services = process.env.VCAP_SERVICES;

  	// Parse the JSON so that we can extract the individual components needed for
 	 // using MySQL
	  services = JSON.parse(services);
	
	  // Since there's only one service, we grab the only node which is for MySQL.
	  var credentials = services.mysql[0].credentials;
	
	  // The credentials node has a lot of fields, but we are only concerned with
	  // the ones below for this MySQL sample.
	  var dbname = credentials.name;
	  var hostname = credentials.hostname;
	  var user = credentials.user;
	  var password = credentials.password;
	  var port = credentials.port;
	
	  response.write("\n Connecting to MySQL...");
	
	  // Create a connection to MySQL
	  var connection = mysql.createConnection({
	    database : dbname,
	    host : hostname,
	    port : port,
	    user : user,
	    password : password
	  });
	
	  connection.connect();
	
	  response.write("\n Connected to MySQL!");
	
	  // Create a query to be executed against a MySQL database.
	  var queryResult = '';
	  connection.query('SELECT \"Hello World\" AS result', function(err, rows, fields) {
	    if (err) {
	      throw err;
	    }
	
	    queryResult = rows[0].result;
	
	    response.write("\n Executed \'SELECT \"Hello World\" AS result\' ");
	    response.write("\n Result =  " + queryResult);
	
	    // Close the connection
	    connection.end(function(err){
	      console.log("\n Closing the MySQL connection");
	   });
	      }

The first line in this section of the Server.js file shows how to retrieve the connection information for the MySQL instance from the application's environment variables. The connection information is represented using JSON. The rest of the code shown here parses the JSON string that was retrieved, connects to the database, execute a query, and prints the response.

	---
	applications:
	- name: mysql-node
	  mem: 128M
	  services:
	    ${name}-db:
	      type: mysql

The *manifest.yaml* file is the configuration information used by ALS to set up the environment. The *services* element instructs ALS how to bind to the MySQL service provided by the ALS cluster to the application.

##Run the Application
1.	Open the Helion Management Console. <br> The Management Console is the web-based administrative interface that can be reached by typing the ALS endpoint URL into a browser window.
2.	Click **Applications**.
3.	If the file push was successful, you should see **mysql-node** in the list of available applications.


##Key Learnings
1.	You need to provide configuration information so that ALS can bind to a MySQL service.
2.	You need to retrieve connection information for MySQL from the application's environment variables, and parse the information into a JDBC compliant connection string.
3.	You interact with and deploy your app using the Helion CLI or the Eclipse [deployment plugin](/helion/devplatform/eclipse/).

----
####OpenStack trademark attribution
*The OpenStack Word Mark and OpenStack Logo are either registered trademarks/service marks or trademarks/service marks of the OpenStack Foundation, in the United States and other countries and are used with the OpenStack Foundation's permission. We are not affiliated with, endorsed or sponsored by the OpenStack Foundation, or the OpenStack community.*
 

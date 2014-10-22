---
layout: default-devplatform
title: "HP Helion Development Platform Java Database Sample"
permalink: /helion/devplatform/workbook/database/java/
product: devplatform

---
<!--PUBLISHED-->


#Java MySQL Database Sample
This very simple Servlet-based Java webapp displays the text "Executed query "SELECT "Hello World!"".", and then the result of that query: "Hello World". This is a demonstration of the minimum requirements to build an application that can connect to a MySQL database provided by ALS and run queries against it. Use this sample to ensure that you have set up your environment for connecting to and working with MySQL on the Helion Development Platform. 

##Prerequisites
If you are missing any of these items, you must [install them](/helion/devplatform/appdev/).

- Access to an Application Lifecycle Service (ALS) [Cluster](/als/v1/admin/cluster/)
- The  [Helion command-line interface (CLI)](/als/v1/user/client/) must be installed.
- Access to the web-based [Helion Management Console](/als/v1/user/console/).

###MySQL

If the MySQL service is not enabled on your cluster, or if you are not sure, follow these steps:

1. Go to the Administrative console for your ALS cluster. <br>For example: *https://api.xx.xx.xx.xx.xip.io*, substitute your own cluster's link.
2. On the **Admin** tab, click **Cluster**.
3. Click the **Settings** icon (a gear icon in the upper right corner)
4. The **MySQL** check box should be checked. If it is not, check it.
5. Click **Save**.

**NOTE**: If a more durable or scalable MySQL database service is needed, ensure your ALS cluster is configured to use a database instance or master/slave pair provided by the Database Service. For more information, refer to [Using the Database Service](/helion/devplatform/databaseservice/) and [Connecting the Database Service with ALS](/helion/devplatform/connectdatabase/).

###JDK

In order to install other prerequisites like Maven you have to have the Java Development Kit (JDK) installed.  The JDK can be installed with he following command on a Mac/UNIX environment.

    sudo apt-get install default-jdk

The simplest way to install JDK on a PC environment is to visit the [JDK installation page](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html), select and run the appropriate installer for your chosen platform.


###Maven

[Maven](http://maven.apache.org/ "Maven") must be installed. 
The simplest way to install Maven on a Mac/UNIX environment is:

	sudo apt-get install maven 

The simplest way to install Maven on a PC environment is to [download the latest version of Maven](http://maven.apache.org/download.cgi) and then follow the [installation directions](http://maven.apache.org/guides/getting-started/windows-prerequisites.html).

##Download the Application Files
[Click here to access the download directory](https://github.com/HelionDevPlatform/helion-mysql-java). 


##Build the Application

If you are not already there, *cd* into this app's root directory and execute:

	mvn clean package

This builds the application with Maven. It will create the *mysql-java-1.0.war* file within the target directory.


##Deploy the Application
**Note**: Application Lifecycle Service clusters that require an upstream HTTP proxy to access the internet will need to be [made aware of the proxy](/als/v1/admin/server/configuration/#staging-cache-app-http-proxy). The sample applications require access to the Internet in order to download dependent packages. 

Use the Helion client to deploy your app to Helion Development Platform.  If you are using Eclipse, you can optionally use the [plugin](/helion/devplatform/eclipse/) to deploy.

1.	Open the [Helion command-line interface (CLI)](/als/v1/user/reference/client-ref/)
3.	Ensure that you are targeting your desired environment.  <br> If you are not, execute
	
		helion target https://api.xx.xx.xx.xx.example.com2.	


1. Ensure that you are logged in to your desired environment.  <br>If you are not, execute
	
		helion login
	
4.	If you are not already there, `cd` to the root directory of the sample.
5.	Execute
	
		helion push
	
6.	Accept any default values that you may be prompted for.
	<br>	**Note**: By default, ALS clusters are configured with two domains (private and public). In some situations the Helion CLI may prompt you to select a target domain. If prompted, select the public domain from the given list (i.e. *<app-name>.xxx.xxx.xxx.xxx.xip.io*)

##Key Code Snippets

This first line in this section of the MysqlServlet.java file shows how to retrieve the connection information for the MySQL instance from the application's environment variables. The connection information is represented using JSON. 

The rest of the code shown here parses the JSON string that was retrieved and builds the appropriate JDBC connection string.

	String vcap_services = System.getenv("VCAP_SERVICES");
	
	        Connection dbConnection = null;
	
	        if (vcap_services != null && vcap_services.length() > 0) {
	            try {
	                // Use a JSON parser to get the info we need from  the
	                // VCAP_SERVICES environment variable. This variable contains
	                // credentials for all services bound to the application.
	                // In this case, MySQL is the only bound service.
	                JsonRootNode root = new JdomParser().parse(vcap_services);
	
	                JsonNode mysqlNode = root.getNode("mysql");
	                JsonNode credentials = mysqlNode.getNode(0).getNode("credentials");
	
	                // Grab login info for MySQL from the credentials node
	                String dbname = credentials.getStringValue("name");
	                String hostname = credentials.getStringValue("hostname");
	                String user = credentials.getStringValue("user");
	                String password = credentials.getStringValue("password");
	                String port = credentials.getNumberValue("port");
	
	                String dbUrl = "jdbc:mysql://" + hostname + ":" + port + "/" + dbname;
	
	                // Connect to MySQL
	                writer.println("Connecting to MySQL...");
	
	                Class.forName("com.mysql.jdbc.Driver");
	                dbConnection = DriverManager.getConnection(dbUrl, user, password);
	            } catch (Exception e) {
	                System.out.println("Caught error: ");
	                e.printStackTrace();
	            }
	        }

The *manifest.yml* file contains configuration information used by ALS to set up the environment. The **services** element informs ALS how to bind to the MySQL service provided by the ALS cluster to the application.	
	
	---
	applications: 
	- name: mysql-java
	  mem: 512M
	  path: target/mysql-java-1.0
	  services:
	    ${name}-db:
	      type: mysql



##Run the Application
1.	Open the Helion Management Console. <br> The Management Console is the web-based administrative interface that can be reached by typing the ALS endpoint URL into a browser window.
2.	Click **Applications**.
3.	If the file push was successful, you should see **mysql-java** in the list of available applications.
4.	The status of the application should be **Started**.  Click the name of the application to launch it.
5.	In the upper right-hand corner, click **View App**.

##Key Learnings
1.	You need to provide configuration information so that ALS can bind to a MySQL service. Configuration information is contained in the *manifest.yml* file.
2.	You need to retrieve connection information for MySQL from the application's environment variables and then parse the information into a JDBC-compliant connection string.
3.	You interact with and deploy your app using the Helion CLI or the Eclipse [plugin](/helion/devplatform/eclipse/).

[Exit Samples](/helion/devplatform/appdev) | [Previous Sample](/helion/devplatform/workbook/helloworld/java/) | [Next Sample](/helion/devplatform/workbook/messaging/java/)

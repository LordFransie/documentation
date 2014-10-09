---
layout: default
title: "HP Helion Public Cloud Python Novaclient CLI Installation"
permalink: /cli/nova/install/
product: nova-cli

---
<!--PUBLISHED-->
# HP Helion Public Cloud v12.12 Python Novaclient CLI Installation#

Before you can begin working with the Novaclient CLI software, you have to install the package.  The instructions below work for Ubuntu, CentOS and Windows installations.<!-- Take a look at the [HP Helion Public Cloud Python Novaclient CLI - Release Notes](/cli/nova/release-notes) for the latest features.-->

This page provides you with the installation information for the following operating systems:

* [Installation prerequisites](#Installation)
* [Ubuntu installation](#Ubuntu)
* [CentOS installation](#CentOS)
* [Windows installation](#Windows)

<!--* [Fedora Installation](#Fedora)-->

[You can download the latest version of the Python Novaclient CLI software here (Version 2.6.8-17)](/file/python-novaclient_2.6.8-17.tar.gz)!

**Note**: These instructions are valid for version 12.12 of the software *only*.  For instructions on installing on version 13.5 of the software, please see the [Command-Line Interface (CLI) Tool installation instructions](https://community.hpcloud.com/article/cloud-135-cli-installation-instructions) page.


##Installation prerequisites## {#Installation}

To install the Python Novaclient CLI on CentOS, you must first download and install [the dependency software (in TAR format)](https://pypi.python.org/packages/source/P/PrettyTable/prettytable-0.5.tar.gz)--follow the instructions in the `setup.py` file included with the package.  (We also assume that you have Python already installed!)

**Note**: We recommend installing the NovaClient on your local system so you always have it available, rather than installing it on an instance which you may want tceo terminate later.

##Ubuntu installation## {#Ubuntu}

The installation procedure in this section is valid for Ubuntu versions 11.04, 11.10, 12.04, and 12.10.  To install the Python NovaClient software on your Ubuntu system, follow these steps while logged in as the root user:

1. Install any available updates:

        apt-get update
        
2. Install the Python `prettytable`, `argparse`, and `httplib2` packages:

        apt-get install python-prettytable python-argparse python-httplib2
    
3. Download the Python NovaClient installation package from our web site:

        wget https://docs.hpcloud.com/file/python-novaclient_2.6.8-17.deb --no-check-certificate
        
    **Note**: If you are installing the software on Ubuntu 12.10, you must all peform the following steps to install the correct version of the `prettytable` package before continuing to Step 4:
    
    * wget http://launchpadlibrarian.net/88803305/python-prettytable_0.5-1ubuntu2_all.deb
    * apt-get remove python-prettytable
    * dpkg -i python-prettytable_0.5-1ubuntu2_all.deb

4. Install the Debian Python Novaclient package:

        dpkg -i python-novaclient_2.6.8-17.deb
        
5. Using the editor of your choice, open your `.bashrc` file for editing:

        vi .bashrc
        
    (You can use `nano` or `emacs` or whatever editing tool you prefer.)
    
6. Add the following variables to the end of your `.bashrc` file:

        export NOVA_USERNAME=USERNAME
        export NOVA_PASSWORD=PASSWORD
        export NOVA_PROJECT_ID=TENANT_NAME
        export NOVA_URL=https://region-a.geo-1.identity.hpcloudsvc.com:35357/v2.0/
        export NOVA_VERSION=1.1
        export NOVA_REGION_NAME=az-1.region-a.geo-1
        
    Where the `USERNAME`, `PASSWORD`, and `TENANT_NAME` values are those you use to access the HP Helion Public Cloud Management Console.  You can find the values for these variables on through the [HP Helion Public Cloud Console](https://horizon.hpcloud.com). Click the project menu and select *Manage Access Keys* and *Account Info*.

    **Note**: The `NOVA_REGION_NAME` variable in this example is set to communicate with instances in the AZ1 availablilty zone.  To use other availability zones, insert AZ2 or AZ3 as the variable instead: `az-2.region-a.geo-1` or `az-3.region-a.geo-1`.

7. Save and exit your `.bashrc` file.

8. Run the `source` command on your `.bashrc` file:

        source .bashrc
        
You can now access your `nova` commands.  For a full list of commands, surf on over to our [CLI Reference page](/cli/nova/reference).


##CentOS Installation## {#CentOS}

CentOS has both Python 2.6.6 and Python-Setuptools 0.1.10 installed by default.  To install the Python NovaClient software on your CentOS system, follow these steps while logged in as the root user:

1. Install any available updates:

        yum -y update
        
2. Download the Python NovaClient installation package from our web site:

        wget https://docs.hpcloud.com/file/python-novaclient_2.6.8-17.tar.gz --no-check-certificate
        
3. Unpack the TAR file:

        tar -zxvf python-novaclient_2.6.8-17.tar.gz
        
4. Change directory to the build directory:

        cd build
        
5. Install the Python NovaClient package:

        python setup.py install
        
6. Change back to the previous directory:

        cd ..
        
7. Download the `python-prettytables` package:

        wget https://pypi.python.org/packages/source/P/PrettyTable/prettytable-0.5.tar.gz --no-check-certificate
        
8. Unpack the TAR file:

        tar -xvzf prettytable-0.5.tar.gz
        
9. Change directory to the prettytable directory:

        cd prettytable-0.5
        
10. Install the prettytable package

        python setup.py install
        
11. Change back to the previous directory:

        cd ..
        
12. Using the editor of your choice, open your `.bashrc` file for editing:

        vi .bashrc
        
    (You can use `nano` or `emacs` or whatever editing tool you prefer.)
    
13. Add the following variables to the end of your `.bashrc` file:

        export NOVA_USERNAME=USERNAME
        export NOVA_PASSWORD=PASSWORD
        export NOVA_PROJECT_ID=TENANT_NAME
        export NOVA_URL=https://region-a.geo-1.identity.hpcloudsvc.com:35357/v2.0/
        export NOVA_VERSION=1.1
        export NOVA_REGION_NAME=az-1.region-a.geo-1
        
Where the `USERNAME`, `PASSWORD`, and `TENANT_NAME` values are the ones you use to access the HP Helion Public Cloud console.  You can find the values for these variables on through the [HP Helion Public Cloud Console](https://horizon.hpcloud.com). Click the project menu and select *Manage Access Keys* and *Account Info*.

**Note**: The `NOVA_REGION_NAME` variable in this example is set to communicate with instances in the AZ1 availablilty zone.  To use other availability zones, insert AZ2 or AZ3 as the variable instead: `az-2.region-a.geo-1` or `az-3.region-a.geo-1`.

14. Save and exit your `.bashrc` file.

15. Run the `source` command on your `.bashrc` file:

        source .bashrc
        
You can now access your `nova` commands.  For a full list of commands, surf on over to our [CLI Reference page](/cli/nova/reference).

<!-- For information on how to install on versions of Ubuntu prior to Release 6.2, please check ou the [Linux Installation knowledge base article](https://community.hpcloud.com/article/python-novaclient-linux-installation).-->

<!--##Fedora Installation## {#Fedora}

Fedora has both Python 2.6.6 and Python-Setuptools 0.1.10 installed by default.  To install the Python NovaClient software on your Fedora system, follow these steps while logged in as the root user:

1. Install any available updates:

        yum -y update
        
2. Download the Python NovaClient installation package from our web site:

        wget https://docs.hpcloud.com/file/python-novaclient_2.6.8-17.tar.gz --no-check-certificate 
        
3. Unpack the TAR file:

        tar -zxvf python-novaclient_2.6.8-1hp17.tar.gz
        
4. Change directory to the build directory:

        cd build
        
5. Install the Python NovaClient package:

        python setup.py install
        
6. Change back to the previous directory:

        cd ..

6. Change back to the previous directory:

        cd ..
        
7. Download the `python-prettytables` package:

        wget https://docs.hpcloud.com/file/nova-stuff.tar --no-check-certificate
        
8. Unpack the TAR file:

        tar -xvzf prettytable-0.5.tar.gz
        
9. Change directory to the prettytable directory:

        cd prettytable-0.5
        
10. Install the prettytable package

        python setup.py install
        
11. Change back to the previous directory:

        cd ..
        
12. Using the editor of your choice, open your `.bashrc` file for editing:

        vi .bashrc
        
    (You can use `nano` or `emacs` or whatever editing tool you prefer.)
    
13. Add the following variables to the end of your `.bashrc` file:

        export NOVA_USERNAME=USERNAME
        export NOVA_PASSWORD=PASSWORD
        export NOVA_PROJECT_ID=TENANT_NAME
        export NOVA_URL=https://region-a.geo-1.identity.hpcloudsvc.com:35357/v2.0/
        export NOVA_VERSION=1.1
        export NOVA_REGION_NAME=az-1.region-a.geo-1
        
Where the `USERNAME`, `PASSWORD`, and `TENANT_NAME` values are the ones you use to access the HP Helion Public Cloud console.  (You can find the values for these variable on your [API Keys](https://console.hpcloud.com/account/api_keys) page in the services console.)

**Note**: The `NOVA_REGION_NAME` variable in this example is set to communicate with instances in the AZ1 availablilty zone.  To use other availability zones, insert AZ2 or AZ3 as the variable instead: `az-2.region-a.geo-1` or `az-3.region-a.geo-1`.

14. Save and exit your `.bashrc` file.

15. Run the `source` command on your `.bashrc` file:

        source .bashrc
        
You can now access your `nova` commands.  For a full list of commands, surf on over to our [CLI Reference page](/cli/nova/reference).-->


##Windows Installation## {#Windows}

To install the Python Novaclient on your system, for full functionality with your HP Helion Public Cloud packages, follow these steps:

* [Installing the Python 2.7 software](#InstallPython)
* [Installing the Python setup tools](#InstallSetupTools)
* [Installing the HP Python-Novaclient software](#InstallHPPythonNovaClient)
* [Configuring the Python NovaClient variables](#ConfiguringVariables)

###Installing the Python  2.7 Software### {#InstallPython}

To install the public Python software on your Windows system, follow these steps:

1. Download [the Python 2.7 software](http://www.python.org/download/).  Select the package that matches your version of Windows:
    * [Python 2.7.3 Windows Installer](http://www.python.org/ftp/python/2.7.3/python-2.7.3.msi) (Windows binary -- does not include source)
    * [Python 2.7.3 Windows X86-64 Installer](http://www.python.org/ftp/python/2.7.3/python-2.7.3.amd64.msi) (Windows AMD64 / Intel 64 / X86-64 binary [1] -- does not include source)
    
2. Run the Windows Installer:

    <img src="media/python_setup_01.png" alt="" />
    
3. In the `Start` menu, open your Control Panel, Select `System` and then click the `Advanced system settings` link:

    <img src="media/python_setup_03.png" width="519" alt="" />

4. In the `Advanced` dialog, select the `Advanced` tab and click `Environment Variables…`:

    <img src="media/python_setup_04.png" alt="" />
    
5. In the `Environment Variables` dialog, select the Path environment variable and click `Edit…`:

    <img src="media/python_setup_05.png" alt="" />

6. In the `Edit System Variable` dialog, append to the Path the installation directory for Python (for example, `;c:\Python27\`):

    <img src="media/python_setup_06.png" alt="" />

7. In the `Edit System Variable` dialog click `OK`.

8. In the `Environment Variables` dialog click `OK`.

###Installing the Python Setup Tools### {#InstallSetupTools}

To install the Python Setup tools, follow these steps:

1. In your browser, open the [Python setuptools](http://pypi.python.org/pypi/setuptools) page.

2. Download [the `ez_setup.py` package](http://pypi.python.org/pypi/setuptools#windows):
    * Right-mouse click the [`ez_setup.py`](http://peak.telecommunity.com/dist/ez_setup.py) link
    * Select `Save link as…` in the pop-up menu
    * Click `Save` in the `Save As` dialog box to save the file to your local system

3. In the `Start` menu, select `All Programs`, `Accessories`, then `Command Prompt` to open a CLI command window.

4. In the `Administrator Command Prompt` window, run `ez_setup.py`:

        C:\Users\biff\Downloads>python ez_setup.py
        Downloading http://pypi.python.org/packages/2.7/s/setuptools/setuptools-0.6c11-py2.7.egg
        Processing setuptools-0.6c11-py2.7.egg
        Copying setuptools-0.6c11-py2.7.egg to c:\python27\lib\site-packages
        Adding setuptools 0.6c11 to easy-install.pth file
        Installing easy_install-script.py script to c:\Python27\Scripts
        Installing easy_install.exe script to c:\Python27\Scripts
        Installing easy_install.exe.manifest script to c:\Python27\Scripts
        Installing easy_install-2.7-script.py script to c:\Python27\Scripts
        Installing easy_install-2.7.exe script to c:\Python27\Scripts
        Installing easy_install-2.7.exe.manifest script to c:\Python27\Scripts
         
        Installed c:\python27\lib\site-packages\setuptools-0.6c11-py2.7.egg
        Processing dependencies for setuptools==0.6c11
        Finished processing dependencies for setuptools==0.6c11
        C:\Users\biff\Downloads>

5. In the `Start` menu, open your Control Panel, Select `System` and then click the `Advanced system settings` link:

    <img src="media/python_setup_03.png" width="519" height="424" alt="" />

6. In the `Advanced` dialog, select the `Advanced` tab and click `Environment Variables…`:

    <img src="media/python_setup_04.png" alt="" />
    
7. In the `Environment Variables` dialog, select the Path environment variable and click `Edit…`:

    <img src="media/python_setup_05.png" alt="" />

8. In the `Edit System Variable` dialog, append to the Path the directory in which the `easy_install.exe` is located (for example, `;c:\Python27\Scripts`):

    <img src="media/python_setup_06.png" alt="" />

9. In the `Edit System Variable` dialog click `OK`.

10. In the `Environment Variables` dialog click `OK`.

###Installing the HP Python-Novaclient software### {#InstallHPPythonNovaClient}

To install the HP Helion Public Cloud Python-Novaclient on your system, follow these steps:

1. Download [the Python NovaClient v2.6.8-17 package](/file/python-novaclient_2.6.8-1hp17.zip) from our web site.
   
2. Extract (using the ZIP or TAR command of your choice) the 2.6.8-17 package.

3. In the `Start` menu, select `All Programs`, `Accessories`, then `Command Prompt` to open a CLI command window.

4. In the `Command Prompt` window, move to the directory that contains the 2.6.8-17 `setup.py` script and execute the following command:

        python setup.py install
    
5. In the `Command Prompt` window, install the correct version of the Python `prettytable` package by executing the following commands:

        easy_install pip
        pip uninstall prettytable==0.6.1
        pip install prettytable==0.5.0
        
    **Note**: You can enter the command `pip freeze` at any time to display a list of the currently-installed Python modules

###Configuring the Python NovaClient Variables### {#ConfiguringVariables}

To configure variables for the Python NovaClient, follow these steps:

1. In the `Start` menu, open your Control Panel, Select `System` and then click the `Advanced system settings` link:

    <img src="media/python_setup_03.png" width="519" alt="" />

2. In the `Advanced` dialog, select the `Advanced` tab and click `Environment Variables…`:

    <img src="media/python_setup_04.png" alt="" />
    
3. In the `Environment Variables…` dialog in the `System variables` section, click `New`:

    <img src="media/python_setup_07.png" alt="" />

4. Add the following new environment variables and values:

        Variable Name     | Value
        ----------------- | -------------
        NOVA_URL          | https://region-a.geo-1.identity.hpcloudsvc.com:35357/v2.0/
        NOVA_REGION_NAME  | Value: az-1.region-a.geo-1 or az-2.region-a.geo-1 or az-3.region-a.geo-1
        NOVA_PROJECT_ID   | Your Tenant Name
        NOVA_USERNAME     | Your Username
        NOVA_PASSWORD     | Your Password
        NOVA_VERSION      | 1.1
    
   **Note**: You can find the values for these variables on through the [HP Helion Public Cloud Console](https://horizon.hpcloud.com).

8. In the `Environment Variables` dialog click `OK`.

9. In the `System Properties` dialog click `OK`.


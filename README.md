
# Welcome to the Documentation of how to set up a multi-machine environment within Oracle VM using Vagrant.

_Summary_ This documentation will guide you step by step on how to set up and configure a multi-machine environment capable of
hosting a app made with Javascript and a database that is connected to the app in a separate virtual machine using MongoDB.

By The end of this you should be able to run the `app.js` file inside the app VM and connect to the website `development.local` via
your preferred browser, without a need for any port such as `3000`. The default port for the server hosting software **NGINX** is
`80` therefore we are also going to be implementing what is known as a reverse proxy to change that port to redirect the user to the
website which will be listening on port `3000`.

## Contents

- [Introduction](#Introduction)
- [Explanation](#Explanation)
- [Installation and Requirements](#Installation-and-Requirements)
- [Booting up the Virtual Machines](#Booting-up-the-Virtual-Machines)
- [Access VM, run server and connect to server in browser](#Access-VM,-run-server-and-connect-to-server-in-browser)

## Introduction
This is a guide of how to install and run the VM for Sparta global, allowing you to access their app in the browser.

## Explanation
The reason for this is so that the process that is usually followed when installing these software into our virtual machine,
are completely automated at the start up of the virtual machine - meaning a less technical member of staff or client can quickly view the
progress by running the command `vagrant up` and this README is also a instructional aid as well.

**Virtual Machine 1 - DB**
*  MongoDB
* Config file

**Virtual Machine 2 - APP**
* Nginx
* Python software
* Node JS
* NPM (package manager) _Get 

## Installation and Requirements

**These Steps are for the installation and set up**

If you already have the VM setup on your machine then skip to the next part [**Booting the VM Machine**](#Booting-up-the-Virtual-Machines)

### **Step 1** Download **Ruby** 

Go to this website: [**Windows**](https://github.com/oneclick/rubyinstaller2/releases/download/RubyInstaller-2.6.6-1/rubyinstaller-devkit-2.6.6-1-x64.exe)
**|** [**Mac**](https://www.ruby-lang.org/en/downloads/)

Follow the instructions on download, and when you are greeted by a Command line looking Ruby Interpreter screen make sure you select to install the third option.
Do this by entering **3**.

To confirm you have downloaded it correctly go to a command line (**Bash**) or (**Shell**) and use:

**`ruby --version`** You should get `ruby 2.6.6p146 (2020-03-32 revision 67876) [x64-mingw32]`

### **Step 2** Download **Vagrant**

Now to download Vagrant, this is the program that will create the `Virtual machine` via the terminal. This is one of many
software that are capable of creating and running the virtual machine, although it is hosted through Oracle VM which we will install later
on. 

Download Vagrant **2.2.7** here: [**Windows**](https://releases.hashicorp.com/vagrant/2.2.7/vagrant_2.2.7_x86_64.msi) **|** [**Mac**](https://releases.hashicorp.com/vagrant/2.2.7/vagrant_2.2.7_x86_64.dmg)

This download may take a while and also ask you to restart your computer, once that is done you will need to confirm the download
was successful.

To confirm you have downloaded it correctly go to a command line (**Bash**) or (**Shell**) and use:

**`vagrant --version`** You should get `vagrant 2.2.7`

**Important**

Now this is an important part if you are **Windows** else carry on to the next part.

If you have **Windows 10 Pro** please go to **Turn on windows features on or off** and turn off **Hyper-V**.
For any other Window versions please follow the next steps to enable virtualization on your machine.

Follow this [**Tutorial**](https://2nwiki.2n.cz/pages/viewpage.action?pageId=75202968#:~:text=ON%20the%20System.-,Press%20F2%20key%20at%20startup%20BIOS%20Setup.,changes%20and%20Reboot%20into%20Windows.)

Once this has been turned on you can continue. If you want to check it has been turned on, go to the **CMD** and type `systeminfo` then
at the bottom make sure the Virtualisation settings are all on.

### **Step 3** Download **Oracle Virtual Machine**

Download Virtual Machine: [**Windows**](https://download.virtualbox.org/virtualbox/6.1.4/VirtualBox-6.1.4-136177-Win.exe) **|** [**Mac**](https://download.virtualbox.org/virtualbox/6.1.4/VirtualBox-6.1.4-136177-OSX.dmg)

Follow the instructions to download it, make sure you have enough room on your drives as it can sometimes be quite large in terms of
when the Virtual machines are made.

To confirm you have got the correct version, open the Oracle VM app and go to `help > about` to see the version.
You should have **`version 6.1.4r136177 (Qt5.6.2)`**

**Important**

If you are on windows, then you will need to follow some extra steps to manually install drivers.

1. In File Explorer, navigate to C:\Program Files\Oracle\VirtualBox\drivers\vboxdrv
2. Right click on the VBoxDrv.inf Setup Information file and and select Install
3. When it's finished installing, open up a new terminal window and run sc start vboxdrv
4. Press the Windows Key and search for Control Panel, go from there to Network and Internet, then Network and Sharing Centre, then Change Adapter Settings.
5. Right click on VirtualBox Host-Only Network and choose Properties
6. Click on Install => Service
7. Under Manufacturer choose Oracle Corporation and under Network Service, choose VirtualBox NDIS6 Bridged Networking driver

Just to be safe, **Restart** your machine one more time.

That is all for the requirements, it should all work now. Next we will see how to set up the environment inside your computer.

## Booting up the Virtual Machines

First of all make sure you have downloaded this Repo as a zip. Create a folder inside one of your directories
called anything you like, a good example could be `VM_MultiMachine` and place that zip inside and unzip it.

## Access VM, run server and connect to server in browser


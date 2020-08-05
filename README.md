
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
- [Access VM](#Access-VM)
- [Run Server](#Run-Server)
- [Open Website in Browser](#Open-Website-in-Browser)

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

Once unzipped you should have the following files in your directory:
* app
* environment
* tests
* .gitignore
* README.md

That means you are ready to start creating your virtual machine using Vagrant! The first thing you need to do
is open a **git bash** command line in **ADMINISTRATOR MODE** so that you have all privileges. Then navigate to the folder
that has the files you just unzipped.

**Tips**
* To change drive simply do `cd /<driveletter/` to change onto that root.
* To go back a directory do `cd ..` to go back a single directory

Once you are inside the directory you unzipped the contents of this repo, type the following command:

```bash
vagrant up
```

This will automatically create a VM for both the app and the database. This may take a few minutes... depending on your
chosen drives speed.

All the dependencies and software should be pre-installed in the provisions that I have added into the `VagrantFile`.

When it comes to a end, the two Oracle machines should be running, there are two ways to check this:

1. Open the `oracle VM VirtualBox Manager` and you will see them both running
2. Type `Vagrant status`

**Perfect** Now you can move onto the next step...

## Access VM

**Important**

If you are not interested in going into the Virtual Machine and just want to access it via the browser, simply skip to
[**Open Website in browser**](#Open-Website-in-Browser)

**Accessing the VM**

To access the Virtual Machine you just created, use the command:

```bash
vagrant ssh <name_of_machine>
```

First of all we are going to enter the `app` machine with `vagrant ssh app` this should load us into the virtual machine.

## Run Server
**Running the server**

If you followed the last [step](#Access-VM) you should be inside your virtual machine where the app can be launched, everything has been
taken care of in the background thanks to the provision. If you are interested in how it works then please go (**HERE**).

The first thing to do is navigate to the app directory, you should be in the home directory now so to check use `ls`, you should see the
app folder. To access the app and run the node app, follow these steps:

```bash
# Navigate into app directory
cd app

# ls to see what is in the directory
ls

# run the node application
sudo node app.js

>> app listening on port 3000 << Expected output 
```

If you have got this far and see the expected output then you are now ready to move onto the next step. The app should now be
available to connect to on the browser.

## Open Website in Browser

The last step is to open a Browser of your choice. I prefer **FireFox**.

Navigate to your URL, from here you can access parts of the **NGINX** server using the `development.local`.
Here is a full list of the websites available.

| URL                             | Description                                                                                                                                                                             |
|---------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| _Development.local_               | This is the home page of the app                                                                                                                                                        |
| _Development.local/fibonacci/`number`_ | This page is of course related to the Fibonacci number sequence. Replace `number` with a digit and it will return the value of that Particular place in the Fibonacci sequence. E.G. /6 → 5  |
| `Development.local/posts`         | This page connects to a database to display a list of posts.                                                                                                                            |

If you would like to know how more about the server, database, proxy and other aspects of this application are set up in the back end,
please refer to this page.

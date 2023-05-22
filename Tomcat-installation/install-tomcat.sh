#!/bin/bash
# TOMCAT.SH
# Steps for Installing tomcat9 on rhel7&8
# install Java JDK 1.8+ as a pre-requisit for tomcat to run.
# https://github.com/LandmakTechnology/package-management/tree/main/Tomcat-installation

# install Java JDK 1.8+ as a pre-requisit for tomcat to run.
sudo hostnamectl set-hostname tomcat
cd /opt 
sudo yum install git wget vim -y
sudo yum install java-1.8.0-openjdk-devel -y
# install wget unzip packages.
sudo yum install wget unzip -y
sudo wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.8/bin/apache-tomcat-10.1.8.zip
sudo tar -xvf apache-tomcat-10.1.8.tar.gz
sudo rm -rf apache-tomcat-10.1.8.tar.gz
### rename tomcat for good naming convention
sudo mv apache-tomcat-10.1.8 tomcat10
### assign executable permissions to the tomcat home directory
sudo chmod 777 -R /opt/tomcat10
sudo chown ec2-user -R /opt/tomcat10
### start tomcat
sh /opt/tomcat10/bin/startup.sh
# create a soft link to start and stop tomcat
# This will enable us to manage tomcat as a service
sudo ln -s /opt/tomcat10/bin/startup.sh /usr/bin/starttomcat
sudo ln -s /opt/tomcat10/bin/shutdown.sh /usr/bin/stoptomcat
sudo starttomcat
echo "end on tomcat installation"
#========

#2. Start of tomcat configuration 

#Tomcat server configuration:
find / -name server.xml context.xml
vim /opt/tomcat9/conf/server.xml
vi /opt/tomcat9/webapps/manager/META-INF/context.xml
vi /opt/tomcat9/conf/tomcat-user.xml  # to add user

	<user username="landmark" password="admin" roles="manager-gui,admin-gui"/>
	

/opt/tomcat9/conf/context.xml

 vi /opt/tomcat9/webapps/manager/META-INF/context.xml
  
  vi /opt/tomcat9/conf/tomcat-user.xml  # to add user
  
	
	username YourName password=PassWord   roles=manager-gui
	
	

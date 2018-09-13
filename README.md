# create_virtual_hos.sh
Bash Script to create new virtual host on macOS

## Description

create_virtual_hos is simple script which create virtual host for local web development. The script add your new host to appache virtual host configuration file and the host files.

### What is added
    
 #### httpd-vhost.conf
   
 <VirtualHost *:80>

   ServerName example.com

   ServerAlias www.example.com

   DocumentRoot "/Users/yourUsername/Sites/example"

   ErrorLog "/private/var/log/apache2/example_log"

   CustomLog "/private/var/log/apache2/example-access_log" common
 </VirtualHost>
 
 ### hosts
  
 127.0.0.1  example.com   www.example.com  

## Why this script

Well, if your using Apache server that ships with macOS there chance that you manually create virtual host for every local project you create.
This script kind of solve that problem by inserting all the necessary info into the required files to have your virtual host up and running.

## Requirement

  * macOS 10.10 or above
  * You have manually setup your webserver
  
# Usage

  * Download the script and extract it to folder (example Desktop)
  * Make the script executable with 
  ```shell
  chmod a+x ./create_virtual_hos.sh
  ```
  * The run it
  ```shell
  ./create_virtual_hos.sh
  ```  
You may need to use sudo

### Required input

  * DocumentRoot = "/path to your project folder" don't forget the double quote, the path should be absolute.
  * ServerAlias = www.example.com or .dev, .local, .test anything you want.
  * ServerName = example.com

GNU Public License version 3. Please feel free to fork and modify this on GitHub (https://github.com/stoneC0der/create_virtual_host).

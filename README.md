# ec2-wp
Terraform Ansible Script to deploy a simple EC2 LAMP Wordpress instance


---------------------------------------
Author : Dino Daniel
Contact : dinodaniel.in@gmail.com
----------------------------------------

This project is to launch a Wordpress Instance on Ubuntu LAMP Server.

The task is deployed under two phases,

   1) Deploy the EC2 instance  : Using Terraform  (Terraform v0.9.11 )
   2) Deploy the WordPress on LAMP : Using Ansible (Ansible v2.2.0.0)



(I) STAGE 1  Deploy EC2 instance

  (A) AWS instance keys to authenticate should be added under ~/.aws/credentials 
  
  (B) Terraform provisions the following services under AWS
      (a) A security group for Wordpress instance to allow port 80 and 22 traffic
      (b) A EC2 Instance (Ubuntu 16.04.2 LTS \n \) with Public & Private IP addresses
      (c) Associate a key to the provisioned EC2 for getting ssh access. User by default will be "ubuntu". Keys are          saved under 'keys' directory
      (d) Once the deployment is done, using 'local-exec' terraform updates Ansible hosts file with new EC2 
          instance's public IP address and trigger Ansible

(II) STAGE 2 Deploy LAMP & Wordpress on EC2
    
   (A) Ansible access to EC2 instance using 'ubuntu' user and deploys Apache, Mysql & PHP first
   (B) Downloads and install Wordpress


TO DEPLOY :


1) ENSURE KEYS ARE ADDED AS MENTIONED IN POINT I.A

2) RUN terraform plan to see the computing path

3) RUN terraform apply, and the process will run and if successfully finished, you can see output similar to below:

-------------------------------------------------------
aws_instance.wordpress_server (local-exec): ==============================================
aws_instance.wordpress_server (local-exec): ----------------------------------------------
aws_instance.wordpress_server (local-exec): Use http://x.x.x.x to load and configure your
aws_instance.wordpress_server (local-exec): 	WordPress Instance
aws_instance.wordpress_server (local-exec): ----------------------------------------------
aws_instance.wordpress_server (local-exec): ===============================================
aws_instance.wordpress_server: Creation complete (ID: i-0160d3a8843518a4a)
--------------------------------------------------------

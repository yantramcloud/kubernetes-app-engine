# README #

### What is this repository for? ###
* Kubernetes application deployment engine.
### Dependencies:
   * Terraform v0.12.18 [Terraform Setup](https://learn.hashicorp.com/tutorials/terraform/install-cli)
   * Helm v3.3.4 [Helm Setup](https://helm.sh/docs/intro/install/)
   * git 2.27.0
   * kubectl 2.27.0

### Setup: 
  * AWX Installation
      * By following [AWX Installer](https://github.com/ansible/awx/blob/devel/INSTALL.md)
      * By Deploying AWX role through Ansible [ansible-role-awx](https://github.com/geerlingguy/ansible-role-awx)
        * This role is also included as a job template which can be run from existing AWX instance.
  * Repo Setup: 
      * All playbooks have been stored in this [repo](https://jayant_kaushal@bitbucket.org/swedishason/ansible-controltower.git)
 
### AWX Configuration : 
login into awx web ui and create the following.

* #### Credential : 
  create 3 credentials with following type.
    * Source Control: Create new credential with your bit bucket repo username/password with type as Source Control
    * Machine: Create new credential username/private key as type Machine with which you should be able to access your machine over SSH.
    * Galaxy: Create new galaxy credential. even if you dont have a galaxy account, create a dummy credential.
* #### Users and Teams : 
   Setup users and teams as required.
* #### Organization: 
   Go to Organization and create new with the above created galaxy credential.
* #### Project :
Project sync will update the latest changes from git repo to AWX Tower.
    * Name: Name of the project
    * Organization: Organization created above
    * Description: Description of the project
    * Source Control URL : URL of the git repo where playbooks are living.
    * Source Control Credential : Credential of your git repo.
* #### Inventory :
    * Name: Name of the inventory
    * Organization: organization created above.
* #### Group: 
  under each inventory you can have groups, create a new group as web,db,awx etc.
    * Hosts: Now add hosts under these groups with ip address.
* #### Job Templates : 
  job templates are wrappers around playbooks,below are some important fields to consider
    * Name: Name of the job template.
    * Inventory: Inventory against which you want to run your hosts.
    * Project: The project in which you have configured your git repo. based on the project selected, playbooks will show up.
    * Credentials: Machine credentials with which you can access your node. 
    * Variables: Variables from the playbook/role which you might want to override. 

###  AWX Job templates :
  Following job templates are available for deployment in current setup.
  
   * #### user_group_management: 
     Creates/Manages a user and group. sets up SSH keys from the repo and adds it to the authorized_keys
       *  node_group: Inventory group of which the hosts are part of.
       *  group_name: Name of the group which is being created/deleted.
       *  group_state: State of the group (present/absent).
       *  user_name: Name of the user which is being created/deleted.
       *  user_state: State of the user (present/absent).
       *  user_key: Name of the public key which is to be injected in the node.
   * #### disk_space_check :
     Checks the disk space available and asserts it against the percentage of the free space.
       *  node_group: Inventory group of which the hosts are part of.
       *  space_available_minimum: Percent of the disk available after which system will start asserting false.
       * Notification and schedule : 
          * A notification and schedule has been attached with this job template which can be configured as per customer needs. 
        
   * #### web_application:
   Installs and setup a web application components on a given node.
     * node_group: Group of which the hosts are part of.
     * Application Installed :
          *  PostgreSQL.
          *  RabbitMQ.
          *  Celery.
   * #### postgres_db_backup :
     Backs up given PostgreSQL DB.
       *  node_group: Inventory group of which the hosts are part of.
       *  db_name: Name of the DB which is being exported.
       *  db_user: Login user for Postgres.
       *  remote_user: Login user for instance.
       *  target: File location where the DB schema will be exported.
   * #### postgres_db_restore : 
     Restores a db from the exported SQL file.
       *  node_group: Inventory group of which the hosts are part of.
       *  db_name: Name of the DB which is being created.
       *  db_user: Login user for Postgres.
       *  remote_user: Login user for instance.
       *  target: File location from where the DB schema will be imported.
   * #### postgres_db_create:
     Creates a new database on the given node with postgres installed.
       *  node_group: Inventory group of which the hosts are part of.
       *  db_name: Name of the DB which is being created.
       *  db_user: Login user for Postgres.
       *  remote_user: Login user for instance.
   * #### logrotate :
     Installs logrotate.
       *  node_group: inventory group of which the hosts are part of.
   * #### awx_installer :
     installs and setup AWX tower on a given node.
      *  node_group: Group of which the hosts are part of.

### How to login into AWX Container ###

* Login into AWX Container
   * SSH into the node where AWX is installed.
   * sudo as root.
   * list the docker containers as docker ps
   * find the container with name awx_task and run
   
   
     
        docker exec -it awx_task /bin/bash


### Further development ###
In case you want to add a new role , add that as part of requirement.yam under roles directory. AWX will automatically pick up
the changes and download the role in repo path.

### Known bugs ###

* AWX Installation: A AWX installation setup has a bug where it  fails if you run the installation with preload data.
[Link](https://github.com/ansible/awx/issues/8863#issuecomment-748591827) for more info.

Also, Galaxy credentials are manadory during organization setup else the role download does not work.

### Who do I talk to? ###

* Repo owner or admin
* jayant@yantram.cloud
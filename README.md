# README #

### What it is : 
* A Terraform and Helm based kubernetes application deployment engine.
* Under every kubernetes namespace,manages and deploys application in their own workspaces.
* Lets you run and manage a set of applications from a single window.
* Supports creating grafana dashboards/folders/data sources in case you are trying to build prometheus monitoring solutions.

### An example deployment for prometheus. 
app-engine uses a deployment file to build application.  deployment has following components.
  * workspace: a virtual container with its own lifecycle.
  * lifecycle_event: 4 life cycle events are supported for this virtual container.
      * create
      * refresh
      * skip
      * destroy
  * deployment_configurations : you can define individual components to be deployed in each of this virtual container.
      * deployments/kube.json
      * deployments/postgresql.json
      * deployments/postgresql.json
  more on the structure of these deployment configurations in next section.

   
    # deployment.yaml 
    ---
    namespace: yantram
    deployments:
    - workspace: kube-prometheus-stack
      lifecycle_event: create
      deployment_configurations:
        - deployments/kube.json
    - workspace: postgresql
      lifecycle_event: create
      deployment_configurations:
        - deployments/postgresql.json
    - workspace: mongodb
      lifecycle_event: refresh
      deployment_configurations:
        - deployments/mongo.json
    - workspace: mongo-express
      lifecycle_event: destroy
      deployment_configurations:
        - deployments/mongo_express.json
    - workspace: apache
      provider_configuration: deployments/provider.json
      lifecycle_event: skip
      deployment_configurations:
        - deployments/apache.json


### Deployment Configurations. 
Each deployment uses deployment configurations.
  * namespace: a kubernetes namespace for deployments and services to be created.
  * chart_configurations: helm charts to be deployed as part of this deployment.
     * name: Name of the chart 
     * chart: chart name as specified in the charts.yaml 
     * chart_values: Input values to be defined for each chart. upon every chart installation default values of this chart will be downloaded into input/default_chart_values   
     * repository: repository name 
     * create_namespace: create kubernetes namespace as part of this deployment. 

   
    {
      "namespace": "yantram",
      "chart_configurations": {
        "kube-prometheus-stack": {
            "name": "kube-prometheus-stack",
            "chart": "kube-prometheus-stack",
            "chart_values": "inputs/app/yantram-kube-prometheus-stack.yaml",
            "repository": "https://prometheus-community.github.io/helm-charts",
            "create_namespace": true
        },
        "postgresql": {
            "name": "postgresql",
            "chart": "postgresql",
            "chart_values": "inputs/app/yantram-postgresql.yaml",
            "repository": "https://charts.bitnami.com/bitnami",
            "create_namespace": false
        },
        "prometheus-postgres-exporter": {
            "name": "prometheus-postgres-exporter",
            "chart": "prometheus-postgres-exporter",
            "chart_values": "inputs/exporters/yantram-prometheus-postgres-exporter.yaml",
            "repository": "https://prometheus-community.github.io/helm-charts",
            "create_namespace": false
        }
      },
      "grafana_folders": {
        "grafana_dashboard_folder": {
          "grafana_dashboard_folder": "yantram"
        }
      },
      "grafana_data_sources": {
        "postgresql": {
          "name": "postgresql",
          "type": "postgres",
          "url": "yantram-postgresql:5432",
          "username": "postgres",
          "password": "postgres",
          "database": "postgres"
        }
      },
      "grafana_dashboards": {
        "postgresql_dashboard": {
          "grafana_dashboard_path": "inputs/dashboards/9106-postgresql_rev1.json"
        }
      }
    }  


### Dependencies:
   * Terraform v0.12.18 [Terraform Setup](https://learn.hashicorp.com/tutorials/terraform/install-cli)
   * Helm v3.3.4 [Helm Setup](https://helm.sh/docs/intro/install/)
   * git 2.27.0
   * kubectl 2.27.0

### Setup: 
  * Docker installation
      * Deploy yantram docker image from docker hub.
  * Manual Installation:
      * on an ubuntu machine install setup.sh.
  * Helm charts installation
      * By Deploying AWX role through Ansible [ansible-role-awx](https://github.com/geerlingguy/ansible-role-awx)
        * This role is also included as a job template which can be run from existing AWX instance.
 

* #### Job Templates : 
  job templates are wrappers around playbooks,below are some important fields to consider
    * Name: Name of the job template.
    * Inventory: Inventory against which you want to run your hosts.
    * Project: The project in which you have configured your git repo. based on the project selected, playbooks will show up.
    * Credentials: Machine credentials with which you can access your node. 
    * Variables: Variables from the playbook/role which you might want to override. 

###  AWX Job templates :
  Following job templates are available for deployment in current setup.

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
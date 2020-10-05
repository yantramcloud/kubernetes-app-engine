# kubernetes-terraform-monitor
All code has been tested against a minikube cluster.
change the provider.tf to configure your cluster.
In this project, we create and configure a postgres deployment using terraform and then monitor that with prometheus.

* Deploy a PostgresSQL 
* Deploy Prometheus monitoring.
* Deploy PostgreSQL-Exporter.
* Configure prometheus operator to scrape postgres.
* Use Grafana dashboard to visualize stats. .

* Version - 0.01

### How do I get set up? ###
* Install terraform on your instance. 
* clone this repo.

# Components #
* run terraform.sh to deploy your terraform configurations.

### How do I get run?
* run terraform.sh to deploy your terraform configurations.
* run destroy.sh to destroy your terraform configurations.


### Contribution guidelines ###


### Who do I talk to? ###
* jayant@yantram.cloud
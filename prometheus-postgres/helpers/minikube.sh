#minukube should be running, if not uncomment below.
minikube delete
docker info --format '{{.OSType}}'
#minikube start --driver=docker
#
#
minikube start

#terraform init


#terraform apply -auto-approve

helm ls

sh kubectl.sh

#terraform apply -var-file="$REPO_ROOT/google/gcp/ansible_components/resources/gcp_compute_facts.tfvars.json" -auto-approve
#terraform apply -auto-approve
#
#
#sh  $REPO_ROOT/google/gcp/ansible_components/provision_applications.sh

# Expose Prometheus UI after installing prometheus-community-chart
#kubectl port-forward services/prometheus-community-helm-prometheus 9090

#minukube should be running, if not uncomment below.
minikube start

terraform init

terraform apply -auto-approve

sh kubectl.sh

#terraform apply -var-file="$REPO_ROOT/google/gcp/ansible_components/resources/gcp_compute_facts.tfvars.json" -auto-approve
#terraform apply -auto-approve
#
#
#sh  $REPO_ROOT/google/gcp/ansible_components/provision_applications.sh

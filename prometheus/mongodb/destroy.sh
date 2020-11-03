


#terraform apply -var-file="$REPO_ROOT/google/gcp/ansible_components/resources/gcp_compute_facts.tfvars.json" -auto-approve
terraform destroy -auto-approve
kubectl delete crd prometheuses.monitoring.coreos.com
kubectl delete crd prometheusrules.monitoring.coreos.com
kubectl delete crd servicemonitors.monitoring.coreos.com
kubectl delete crd podmonitors.monitoring.coreos.com
kubectl delete crd alertmanagers.monitoring.coreos.com
kubectl delete crd thanosrulers.monitoring.coreos.com
kubectl delete crd probes.monitoring.coreos.com

#sh ../helpers/kubectl.sh
#sh ../../../../helpers/kubectl.sh

#
#
#sh  $REPO_ROOT/google/gcp/ansible_components/provision_applications.sh

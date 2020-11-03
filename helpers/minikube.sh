#minukube should be running, if not uncomment below.
docker info --format '{{.OSType}}'

echo ----------------------------------------------------- Deleting Minikube Cluster------------------------------------------

minikube config set WantUpdateNotification false
minikube delete
kubectl delete crd prometheuses.monitoring.coreos.com
kubectl delete crd prometheusrules.monitoring.coreos.com
kubectl delete crd servicemonitors.monitoring.coreos.com
kubectl delete crd podmonitors.monitoring.coreos.com
kubectl delete crd alertmanagers.monitoring.coreos.com
kubectl delete crd thanosrulers.monitoring.coreos.com
kubectl delete crd probes.monitoring.coreos.com


minikube start

#
#
#
#minikube start --kubernetes-version=v1.19.0 --memory=8192 --extra-config=kubelet.authentication-token-webhook=true --extra-config=kubelet.authorization-mode=Webhook --extra-config=scheduler.address=0.0.0.0 --extra-config=controller-manager.address=0.0.0.0
#minikube start --kubernetes-version=v1.11.1 --memory=8192 --bootstrapper=kubeadm --extra-config=kubelet.authentication-token-webhook=true --extra-config=kubelet.authorization-mode=Webhook --extra-config=scheduler.address=0.0.0.0 --extra-config=controller-manager.address=0.0.0.0

#terraform init


#terraform apply -auto-approve


# sh kubectl.sh

#terraform apply -var-file="$REPO_ROOT/google/gcp/ansible_components/resources/gcp_compute_facts.tfvars.json" -auto-approve
#terraform apply -auto-approve
#
#
#sh  $REPO_ROOT/google/gcp/ansible_components/provision_applications.sh

# Expose Prometheus UI after installing prometheus-community-chart
#
#

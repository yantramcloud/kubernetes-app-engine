#!/bin/bash
#
# author: Jayant Kaushal
# site: http://yantram.cloud
# purpose: Basic kubectl introduction

#list all the nodes running. remember if you are running minicube, there will be only one node which will act both and master and worker node
#echo 'Get Help on kubectl \n'
#kubectl -h
kubectl config view
echo 'Listing all the Nodes'
echo '#####################################################################################'
kubectl get nodes
echo '#####################################################################################'

#get pods
#echo '\n'
#echo 'Describing node minicube \n'

#kubectl describe node minikube
#kubectl delete node mysql-1601062233-f675f9c4-59nww


#minikube start
#get pods
echo '\n'
echo 'pods'
echo '#####################################################################################'
kubectl get pods
echo '#####################################################################################'
echo '\n'
echo 'services'
echo '#####################################################################################'
kubectl get services
echo '\n'
echo 'deployments'
echo '#####################################################################################'
kubectl get deployment
echo '#####################################################################################'
echo ' replicaset \n'
echo '#####################################################################################'
kubectl get replicaset
echo '#####################################################################################'
echo '\n'
echo 'statefulset'
echo '#####################################################################################'
kubectl get statefulset
echo '\n'
echo 'servicemonitor'
echo '#####################################################################################'
kubectl get servicemonitor
echo '\n'
#echo 'Edit a deployment : #kubectl edit DEPLOYMENT_NAME\n'
##kubectl edit deployment mysql-1600416151
echo 'installed_helm_charts'
echo '#####################################################################################'
helm ls
#helm repo update
#echo '\n'
#echo 'Debug a kubernetes pod -- log in to application terminal and then look inside \n'
#kubectl logs mysql-1600416151-689d49c5fb-wzh4h
helm show values prometheus-community/prometheus-postgres-exporter > yantram-postgresql-exporter.yaml
kubectl describe servicemonitor yantram-postgresql-exporter-prometheus-postgres-exporter  > yantram-postgresql-exporter_created.yaml




#echo '\n'
#echo 'Describe a kubernetes pod -- remember it takes a pod to debug , not deployment, not service not anything else \n'
##kubectl describe pod mysql-1600416151-689d49c5fb-wzh4h
#echo 'Debug a kubernetes pod -- remember it takes a pod to debug , not deployment, not service not anything else \n'
##kubectl exec -it echo '\n'
#echo 'Debug a kubernetes pod -- remember it takes a pod to debug , not deployment, not service not anything else \n'
##kubectl exec  mysql-1600416151-689d49c5fb-wzh4h -- bin/bash -it
#
#
#echo 'Delete a deployment \n'
##kubectl delete deployment  mysql-1600416151




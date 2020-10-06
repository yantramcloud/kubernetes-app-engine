#!/bin/bash
#
# author: Jayant Kaushal
# site: http://yantram.cloud
# purpose: Basic kubectl introduction

#list all the nodes running. remember if you are running minicube, there will be only one node which will act both and master and worker node
#echo 'Get Help on kubectl \n'
#kubectl -h

#kubectl describe servicemonitor yantram-postgresql-exporter-prometheus-postgres-exporter

helm show values prometheus-community/prometheus-postgres-exporter




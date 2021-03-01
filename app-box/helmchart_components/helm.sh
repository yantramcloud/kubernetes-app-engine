#!/bin/bash
#
# author: Jayant Kaushal
# site: http://yantram.cloud
# purpose: Create a nginx service in kubernetes cluster



helm show values prometheus-community/kube-prometheus-stack > kube-prometheus-stack.yaml

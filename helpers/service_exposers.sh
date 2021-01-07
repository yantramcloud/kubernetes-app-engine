#kubectl describe servicemonitor yantram-mongodb-exporter-prometheus-mongodb-exporter

helm show values prometheus-community/prometheus-mongodb-exporter > yantram-mongo-exporter.yaml
kubectl port-forward services/yantram-prometheus-kube-pr-prometheus 9090
kubectl port-forward services/yantram-prometheus-grafana 5555:80
kubectl port-forward services/yantram-prometheus-prometheus-node-exporter 9100
kubectl port-forward services/yantram-mongodb 27017
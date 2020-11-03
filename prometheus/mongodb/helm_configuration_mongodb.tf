resource "helm_release" "yantram-mongodb" {
  name = "yantram-mongodb"
  repository = "https://charts.bitnami.com/bitnami"
  chart = "mongodb"
}
resource "helm_release" "yantram-prometheus" {
  name = "yantram-prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart = "kube-prometheus-stack"
  depends_on = [helm_release.yantram-mongodb]
}

resource "helm_release" "prometheus-mongodb-exporter" {
  name = "prometheus-mongodb-exporter"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart = "prometheus-mongodb-exporter"
    values = [
    file("inputs/yantram-mongodb-values.yaml")
  ]
depends_on = [helm_release.yantram-prometheus]
}
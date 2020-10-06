resource "helm_release" "yantram_mongodb" {
  name = "yantram-mongodb"
  repository = "https://charts.bitnami.com/bitnami"
  chart = "mongodb"
}
resource "helm_release" "yantram-mongodb-exporter" {
  name = "yantram-mongodb-exporter"
  repository = "https://prometheus-community.github.io/helm-charts"
//  depends_on = [
//    yantram-prometheus.yantram_mongodb
//  ]
  chart = "prometheus-mongodb-exporter"
    values = [
    file("inputs/yantram-mongodb-values.yaml")
  ]

}
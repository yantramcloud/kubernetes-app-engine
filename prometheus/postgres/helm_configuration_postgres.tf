resource "helm_release" "yantram-postgresql" {
  name = "yantram-postgresql"
  repository = "https://charts.bitnami.com/bitnami"
  chart = "postgresql"
}
resource "helm_release" "prometheus-postgres-exporter" {
  name = "prometheus-postgres-exporter"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart = "prometheus-postgres-exporter"
    values = [
    file("yantram-postgresql-values.yaml")
  ]

}
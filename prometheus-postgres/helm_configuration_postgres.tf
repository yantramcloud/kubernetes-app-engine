resource "helm_release" "yantram_postgresql" {
  name = "yantram-postgresql"
  repository = "https://charts.bitnami.com/bitnami"
  chart = "postgresql"
}
resource "helm_release" "yantram_postgresql-exporter" {
  name = "yantram-postgresql-exporter"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart = "prometheus-postgres-exporter"
    values = [
    file("yantram-postgresql-values.yaml")
  ]

}
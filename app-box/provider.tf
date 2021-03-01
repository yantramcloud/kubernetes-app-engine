provider "helm" {
  kubernetes {
    config_path = var.kubernetes_configurations.config_path
    config_context = var.kubernetes_configurations.config_context_cluster
  }
  version = "2.0.2"
}
provider "grafana" {
  url = var.grafana_configurations.grafana_url
  auth = var.grafana_configurations.grafana_auth
  org_id = 1
  version = "~> 1.8"
}

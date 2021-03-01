module "helm_chart" {
  source = "./terraform_components/modules/apps/yantram-helm_chart-component"
  namespace = var.namespace
  helm_chart_list = var.chart_configurations
}
module "grafana_folders" {
  source = "./terraform_components/modules/apps/grafana-folder"
  grafana_folders = var.grafana_folders
}
module "grafana_data_source" {
  source = "./terraform_components/modules/apps/grafana-datasource"
  grafana_data_sources = var.grafana_data_sources
}
module "grafana-dashboard" {
  source = "./terraform_components/modules/apps/grafana-dashboard"
  grafana_dashboards = var.grafana_dashboards
}

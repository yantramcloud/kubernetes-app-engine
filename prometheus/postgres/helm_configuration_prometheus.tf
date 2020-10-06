resource "helm_release" "yantram-prometheus" {
  name = "yantram-prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart = "kube-prometheus-stack"
}
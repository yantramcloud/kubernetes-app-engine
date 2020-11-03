resource "helm_release" "yantram-apache" {
  name = "yantram-apache"
  repository = "https://charts.bitnami.com/bitnami"
  chart = "apache"
}
resource "helm_release" "yantram-prometheus" {
  name = "yantram-prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart = "kube-prometheus-stack"
  depends_on = [helm_release.yantram-apache]
}


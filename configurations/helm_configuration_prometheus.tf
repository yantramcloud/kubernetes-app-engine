resource "helm_release" "yantram_prometheus" {
  name = "prometheus-community-helm-example"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart = "kube-prometheus-stack"
//  values = [
//    file("values.yaml")
//  ]

//  set {
//    name = "cluster.enabled"
//    value = "true"
//  }
//
//  set {
//    name = "metrics.enabled"
//    value = "true"
//  }
}
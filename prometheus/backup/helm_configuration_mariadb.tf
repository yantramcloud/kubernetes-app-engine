resource "helm_release" "yantram_mariadb" {
  name = "yantram_mariadb"
  chart = "stable/mariadb"

  set {
    name = "mariadbUser"
    value = "admin"
  }

  set {
    name = "mariadbPassword"
    value = "password"
  }
  set {
    type = "string"
    name = "image.tags"
    value = "registry\\.io/terraform-provider-helm\\,example\\.io/terraform-provider-helm"
  }
}
resource "helm_release" "my_database" {
  name = "my-database"
  chart = "stable/mariadb"

  set {
    name = "mariadbUser"
    value = "foo"
  }

  set {
    name = "mariadbPassword"
    value = "qux"
  }
  set {
    type = "string"
    name = "image.tags"
    value = "registry\\.io/terraform-provider-helm\\,example\\.io/terraform-provider-helm"
  }
}
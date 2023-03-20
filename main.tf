resource "helm_release" "plk" {
  chart = "https://grafana.github.io/helm-charts"
  name  = "grafana/loki-stack"
  create_namespace = true
  namespace = "plk"

  values = [yamlencode(
    loki = {
      env = {

      }
      config = {
        schema_config = {

        }
        storage_config = {
          aws = {
            s3 = ""
            s3forcepathstyle = true
            bucketnames =
            region =
            insecure =
            sse_encryption =
          }
          boltdb_shipper = {
            shared_store = "s3"
            cache_ttl = "24h"
          }
        }
      }
    }
    grafana = {
      enabled = true
      sidecar = {
        datasources = {
          enabled = true
        }
      }
      image = {
        tag = "latest"
      }
    }
  )]
}

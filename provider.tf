terraform {
  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"
      version = "~> 1.34.0"
    }
    tls = {
      source = "hashicorp/tls"
      version = "~> 4.0"
    }
  }
}

provider "huaweicloud" {
  region     = "la-north-2"
  access_key = "HPUALBP1METRKR5UWHY5"
  secret_key = "iNdjG6SiTqzaVS8mV2XWlj30ay0IjjWtn0c2Fdb9"
  cloud      = "myhuaweicloud.com"
}
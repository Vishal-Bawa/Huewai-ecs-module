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
  access_key = 
  secret_key = 
  cloud      = "myhuaweicloud.com"
}

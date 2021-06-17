terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
  }
}
module "provider" {
    source = var.dev_cluster
}

# deployments
module "deployment-users" {
    source = "./microservices/users/deployment"    
}
module "deployment-files" {
    source = "./microservices/users/deployment"    
}

# services
module "service-users" {
  source = "./microservices/users/service"
}
module "service-files" {
  source = "./microservices/files/service"
}

# ingress
module "gateway" {
  source = "./ingress"
}

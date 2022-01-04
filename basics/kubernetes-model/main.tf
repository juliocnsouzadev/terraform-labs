terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
  }
}
module "provider" {
    source = "./modules/provider/development"
}

# deployments
module "deployment-users" {
    source = "./modules/microservices/users/deployment"    
}
module "deployment-files" {
    source = "./modules/microservices/users/deployment"    
}

# services
module "service-users" {
  source = "./modules/microservices/users/service"
}
module "service-files" {
  source = "./modules/microservices/files/service"
}

# ingress
module "gateway" {
  source = "./modules/ingress"
}

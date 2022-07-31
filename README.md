# Terraform Labs

## IAC AWS Project
[folder](./iac_aws)

## Basic commands
```bash
terraform init
terraform validate
terraform fmt
terraform show
terraform providers
terraform output
terraform refresh
terraform graph
terraform graph | dot -Tpng > graph.png
terraform plan
terraform apply
terraform destroy
```

## Auxiliary software
```bash
chocolatey install graphviz
```

## Lifecycle
```
resource "random_string" "string" {
    length = 10
    keepers = {
        length = 10
    }
    lifecycle {
        create_before_destroy =  true #  a new random string is created first before the old one is destroyed
    }     
}
resource "random_string" "string" {
    length = 10
    keepers = {
        length = 10
    }
    lifecycle {
        prevent_destroy =  true # is not destroyed under any circumstances
    }     
}

```

## Datasources
```
output "os-version" {
  value = data.local_file.os.content
}
data "local_file" "os" {
  filename = "/etc/os-release"
}
```
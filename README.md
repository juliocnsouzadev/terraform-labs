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

## Count
```
variable "users" {
    type = list
    default = [
        "user-a",
        "user-b",
        "user-c"
    ]
}
variable "content" {
    default = "password: S3cr3tP@ssw0rd"
  
}

```
```
resource "local_file" "name" {
    filename = var.users[count.index]
    sensitive_content = var.content
    count = 3
}
```


## Foreach
```
variable "users" {
    type = list(string)
    default = [ "/root/user10", "/root/user11", "/root/user12", "/root/user10"]
}
variable "content" {
    default = "password: S3cr3tP@ssw0rd"
  
}
```

```
resource "local_file" "name" {
    filename = each.value
    sensitive_content = var.content
    for_each = toset(var.users)
}
```


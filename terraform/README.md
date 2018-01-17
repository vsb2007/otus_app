# Terraform

- Install [Terraform](https://www.terraform.io/downloads.html)

# Init
Before init you must create backends storage on your cloud platform and edit `backends.tf` file.
Change `main.tf` as you wish/need.

Then:
```
$ terraform init
$ terraform plan
$ terraform apply
```
for create k8s claster




Main Commands
```
 Remote Backend works if creadentals are given by env varible.
 E.G. export GOOGLE_CREDENTIALS=$(cat account.json)

 backends.tf - config file

terraform init
terraform plan
terraform apply
terraform output
terraform destroy

```
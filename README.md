# This repo contains Azure-Databricks deployment playground

## Prerequisite 
- [Azure knowledge](https://azure.microsoft.com/en-us/resources/cloud-computing-dictionary/what-is-azure/)
- [Databricks knowledge](https://www.databricks.com/)
- [Terraform knowledge](https://www.terraform.io/)
- [Install Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
### Let's start
```
$ git clone https://github.com/chavo1/azure-databricks.git
$ cd azure-databricks
```
- Have your credentials in order to authenticate to Azure 
    - Rename terraform.tfvars-example to terraform.tfvars and fill the credentials<br /> 
    or
    - [Env variable](https://learn.microsoft.com/en-us/azure/developer/terraform/authenticate-to-azure?tabs=bash#specify-service-principal-credentials-in-environment-variables)<br /> 
    or
    - [az login](https://learn.microsoft.com/en-us/azure/developer/terraform/authenticate-to-azure?tabs=bash#authenticate-to-azure-via-a-microsoft-account)
```
$ terraform init
$ terraform plan
$ terraform apply
```
- Do not forget to destroy the environment 
```
$ terraform destroy
```

# infra-terraform-kubernetes-azure
## Infra Kubernetes

###Instruções em português

Criação de cluster Kubernetes com Terraform na Azure (AKS).

#### Dependências 
* Terraform
* Azure CLI

#### Inicializar

Faça login na azure pelo terminal:

az login

Crie sua credencial de acesso Active Directory (AD) no Azure executando:

az ad sp create-for-rbac --skip-assignment

O comenado vai retornar o seguinte:

{

  "appId": "aaaaaaa-aaaaaaa-bbbbb-ccccc",

  "displayName": "azure-cli-NNNNNNNN",

  "name": "http://azure-cli-HHHHHHHH",

  "password": "ppppppp-pppppp-pppp-ppppp",

  "tenant": "ttttttt-tt-t-t-ttttttt-t"

}

Crie o arquivo terraform.tfvars com os seguintes valores extraidos do retorno do comando anterior:

app-id    = < AD appId>

app-password = < AD password >

Execute "terraform plan" para verificar as alterações e "terraform apply" para aplicá-las na sua núvem Azure.
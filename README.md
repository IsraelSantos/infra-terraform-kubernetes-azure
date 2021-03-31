# infra-terraform-kubernetes-azure
## Infra Kubernetes

###Instruções em português

Criação de cluster Kubernetes com Terraform na Azure (AKS).

#### Dependências 
* Terraform
* Azure CLI
* kubectl
* grep
* awk

#### Inicializar

Faça login na azure pelo terminal:

`$ az login`

Crie sua credencial de acesso Active Directory (AD) no Azure executando:

`$ az ad sp create-for-rbac --skip-assignment`

O comanado vai retornar o seguinte:

```javascript
{
  "appId": "aaaaaaa-aaaaaaa-bbbbb-ccccc",
  "displayName": "azure-cli-NNNNNNNN",
  "name": "http://azure-cli-HHHHHHHH",
  "password": "ppppppp-pppppp-pppp-ppppp",
  "tenant": "ttttttt-tt-t-t-ttttttt-t"
}
```

Crie o arquivo terraform.tfvars com os seguintes valores extraidos do retorno do comando anterior:

app-id    = < AD appId>

app-password = < AD password >

Execute "`$ terraform plan`" para verificar as alterações e "`$ terraform apply`" para aplicá-las na sua núvem Azure.

### Configurar kubectl
Agora que provisionou seu cluster AKS, você precisa configurar o na sua máquina kubectl.

Primeiro inatale-o usando o Chocolatey se for no Windows ou apt em distribuições Linux Debian

Windows
`$ choco install kubectl`

Ubuntu linux
`$ apt install -y kubectl`

Após instalado execute o seguinte comando para recuperar as credenciais de acesso para seu cluster e configurar automaticamente kubectl.

`$ az aks get-credentials --resource-group $(terraform output resource_group_name) --name $(terraform output kubernetes_cluster_name)`
### Visualizar painel do Kubernetes

Para visualizar o painel do Kubernets primeiro execute:

`$ az aks browse --resource-group $(terraform output resource_group_name) --name $(terraform output kubernetes_cluster_name)`

Você poderá ver o painel em http://127.0.0.1:8001/

Para entrar gere a token em outra janela de terminal com o seguinte comando:

`$ kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep service-controller-token | awk '{print $1}')`

Nota: caso a sua máquina não possua os programas grep e/ou awk, basta instalar os mesmos usando o Chocolatey no Windows.

Após isso copie e cole token na tela de http://127.0.0.1:8001/.

Agora será possível fazer o deploy das suas aplicações.
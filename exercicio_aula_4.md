# Fazendo o deploy automatizado via Terraform

Nesta aula utilizaremos infraestrutura como código para fazer o deploy da nossa aplicação na Azure. Para isso, utilizaremos o Terraform.

## Configurando um 'Service Principal' para o Terraform

Para que o Terraform possa se comunicar com a Azure, precisamos criar um 'Service Principal' com permissões de acesso à nossa conta. Para isso, siga os passos abaixo:

1. Acesse o portal da Azure e clique no ícone do terminal no canto superior direito da tela.
2. Clique em 'Create storage' e crie um novo storage account.
3. Espere o terminal ser criado
4. Execute o comando abaixo para criar um 'Service Principal' com permissões de acesso à sua conta:

```bash
   az ad sp create-for-rbac --name "myApp" --role contributor --scopes /subscriptions/{subscription-id}
```
Substitua `{subscription-id}` pelo seu subscription id.

:attention: O seu 'Subscription ID' pode ser encontrado no portal da Azure, na aba 'Subscriptions'.

<!-- 5. Copie o resultado e salve como um Secret no seu repositório do GitHub. Para isso, vá até a aba 'Settings' do seu repositório, clique em 'Secrets' e crie um novo secret com o nome `AZURE_CREDENTIALS` e o valor copiado. -->

5. Copie o valor de `appId` e salve como um Secret no seu repositório do GitHub. Para isso, vá até a aba 'Settings' do seu repositório, clique em 'Secrets' e crie um novo secret com o nome `ARM_CLIENT_ID` e o valor copiado.

6. Copie o valor de `password` e salve como um Secret no seu repositório do GitHub. Para isso, vá até a aba 'Settings' do seu repositório, clique em 'Secrets' e crie um novo secret com o nome `ARM_CLIENT_SECRET` e o valor copiado.

7. Copie o valor de `tenant` e salve como um Secret no seu repositório do GitHub. Para isso, vá até a aba 'Settings' do seu repositório, clique em 'Secrets' e crie um novo secret com o nome `ARM_TENANT_ID` e o valor copiado.

8. Crie um secret com o nome `ARM_SUBSCRIPTION_ID` e o valor do seu subscription id.
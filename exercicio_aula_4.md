# Fazendo o deploy automatizado via Terraform

Nesta aula utilizaremos infraestrutura como código para fazer o deploy da nossa aplicação na Azure. Para isso, utilizaremos o Terraform para o deploy da infraestrutura e GitHub Actions para uma estratégia de deploy _'Blue-Green'.

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

5. Copie o resultado e salve como um Secret no seu repositório do GitHub. Para isso, vá até a aba 'Settings' do seu repositório, clique em 'Secrets' e crie um novo secret com o nome `AZURE_CREDENTIALS` e o valor copiado.
6. Copie o valor de `appId` e salve como um Secret no seu repositório do GitHub. Para isso, vá até a aba 'Settings' do seu repositório, clique em 'Secrets' e crie um novo secret com o nome `ARM_CLIENT_ID` e o valor copiado.
7. Copie o valor de `password` e salve como um Secret no seu repositório do GitHub. Para isso, vá até a aba 'Settings' do seu repositório, clique em 'Secrets' e crie um novo secret com o nome `ARM_CLIENT_SECRET` e o valor copiado.
8. Copie o valor de `tenant` e salve como um Secret no seu repositório do GitHub. Para isso, vá até a aba 'Settings' do seu repositório, clique em 'Secrets' e crie um novo secret com o nome `ARM_TENANT_ID` e o valor copiado.
9. Crie um secret com o nome `ARM_SUBSCRIPTION_ID` e o valor do seu subscription id.

## Configurando seu repositório para executar Actions

1. Vá na aba de `Actions` do seu repositório e clique em _'I understand my workflows, go ahead and enable them'_.
2. Em seguida, clique no workflow de nome `Deploy Azure WebApp resources using Terraform`.
3. Um banner azul aparecerá no cabeçalho da tela central. Clique em `Run workflow`, em seguida no botão verde `Run workflow`. Como na imagem abaixo:

<img width="373" alt="image" src="https://user-images.githubusercontent.com/609076/221066635-30561393-b467-4d9a-9d4f-29346dba0233.png">


## Ajustando o seu workflow

Na pasta `.github/workflows`, abra o arquivo `main_exercicio-aula-4.yml` e substitua o valor do `app-name` **(linhas 66 e 93)** de `octodex` para o nome aleatório gerado pelo Terraform
- Você pode ver o nome do seu app nos logs da execução de Actions ou fazendo login na Azure

## Colocando uma mudança em teste

1. Para fazer o exercício você vai precisar criar um Codespaces. Na aba `Code`, clique no botão verde 'Code', e em seguida na aba 'Codespaces', clique no ícone de `+`.
2. Você verá que uma nova aba será aberta e, após carregar, o Visual Studio Code será aberto.
3. No canto superior esquerdo, clique no ícone do menu (ícone com três barras horizontais paralelas), vá em `Terminal` > `New Terminal`.
4. Um terminal aparecerá na parte inferior direita da sua tela. Execute o seguinte comando:
```bash
npm run dev
```
5. Após os logs, clique no link (CTRL+clique) `https://localhost:3000`.

Essa é a aplicação com a qual queremos trabalhar. Se você utilizar o seu computador em modo noturno, ela terá o fundo escuro, caso utilize no modo claro, ela terá o fundo branco. O que queremos fazer, é dar ao usuário a opção de escolher, manualmente, qual modo deseja usar. Por isso vamos fazer uma modificação no código.

Todo o código necessário já está pronto. Para isso, basta executar uma tarefa do VS Code.

6. No mesmo menu superior esquerdo, selectione `Terminal` > `Run task...`.
7. No centro da tela, na parte superior, aparecerá um campo de input. Selecione a opção `code dark mode toggle`.
8. Em seguida aparecerá a opção para você inserir o nome do branch que será criado automaticamente. Virá preenchido automaticamente `dark-mode`. Apenas aperte `Enter`.
9. Execute novamente o comando do passo 4. E veja que apareceu um ícone após o cabeçalho. Clique no ícone e veja o estilo do app ser alterado.
```bash
npm run dev
```
10. Perfeito. Alteração pronta, vamos enviar as modificações para o GitHub. No menu esquerdo, selecione o ícone do Git. É um gráfico com uma ramificação, veja abaixo:
<img width="58" alt="image" src="https://user-images.githubusercontent.com/609076/221063415-a48495f8-357b-407d-a87d-2efdb5870ffe.png">

11. Na caixa de texto escrito `Message`, digite sua mensagem de commit. **Não se esqueça dos formatos de mensagem de commit que vimos na aula passada!**
12. Clique no botão verde `Commit`
13. Em seguida clique no botão verde `Publish Branch`
14. Você pode fechar a aba com o Codespaces aberto
15. Volte para o GitHub, na aba `Pull requests`. Você verá um banner amarelo com um botão verde escrito `Compare & pull request`. Clique no botão.
16. Clique no botão verde abaixo da caixa de texto `Create pull request`. (Opcional) você pode criar uma mensagem descrevendo as mudanças que você está implementando. Assim que clicar no botão, as validações começarão a rodar. Serão executados builds, testes e um deploy do app para um slot da Azure. Para verificarmos se ele estará entregue conforme desenvolvemos. Você verá algo como abaixo:

<img width="847" alt="image" src="https://user-images.githubusercontent.com/609076/221065736-287f42bb-034e-4732-8513-714c68c68454.png">

17.  A execução do workflow levará um tempo, isso é o tempo que leva para fazer o deploy do Web App na Azure (máquina menor, do nosso plano gratuito)
18.  Após terminar a execução, clique no link azul que foi exibido na caixa do job de deploy. Ele te levará para a sua aplicação na Azure (pode levar alguns segundos para processar, pois agora a mesma máquina está sendo utilizada para duas aplicações)
19.
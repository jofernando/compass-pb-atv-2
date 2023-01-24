# Documentação da atividade sobre AWS e Linux

Jose Fernando Mendes da Costa

## Sumário

1. [Criando um gateway da internet](https://github.com/jofernando/compass-pb-atv-2/#criando-um-gateway-da-internet)
1. [Alterando sua VPC](https://github.com/jofernando/compass-pb-atv-2/#alterando-sua-vpc)
2. [Alterando seu grupo de segurança](https://github.com/jofernando/compass-pb-atv-2/#alterando-seu-grupo-de-segurança)
3. [Criação do seu par de chaves](https://github.com/jofernando/compass-pb-atv-2/#criação-do-seu-par-de-chaves)
4. [Criação da sua instância](https://github.com/jofernando/compass-pb-atv-2/#criação-da-sua-instância)
5. [Criação do seu ip elástico](https://github.com/jofernando/compass-pb-atv-2/#criação-do-seu-ip-elástico)

### Criando um gateway da internet
Como criar um gateway da internet usando o Console de gerenciamento da AWS
1. Abra o console da Amazon VPC em https://console.aws.amazon.com/vpc/ (realize o login se não estiver logado).
2. No painel de navegação, clique em `Gateways da internet`.
3. Clique em `Criar gateway da internet`.
4. No campo nome informe um nome descritivo.
5. Clique em `Criar gateway da internet`.
### Alterando sua VPC

Como alterar sua VPC usando o Console de gerenciamento da AWS
1. Abra o console da Amazon VPC em https://console.aws.amazon.com/vpc/ (realize o login se não estiver logado).
2. No painel de navegação, clique em `Tabela de rotas`.
3. Selecione a tabela de rotas associada a Sub-rede privada A.
4. Clique em `Ações` e `Editar rotas`:
1. Adicione a seguinte entrada na tabela de rotas, em `Destino`: `0.0.0.0/0` e em `Alvo` coloque o internet gateway criado anteriormente.
1. Clique em `Salvar alterações`.

### Alterando seu grupo de segurança

Como alterar seu grupo de segurança usando o Console de gerenciamento da AWS
1. Faça login no AWS Management Console e abra o console do Amazon EC2 em https://console.aws.amazon.com/ec2/.
2. No painel de navegação, selecione `Grupos de segurança`.
3. Selecione o grupo de segurança existente.
4. Clique em `Ações` e em `Editar regras de entrada`.
5. Em `VPC` Selecione a VPC criada anteriormente.
6. Nas regras de entrada, adicine as seguintes regras:


| Name | ID da regra do grupo de segurança | Versão do IP | Tipo | Protocolo | Intervalo de portas | Origem | Descrição          |
|------|-----------------------------------|--------------|------|-----------|---------------------|--------|--------------------|
| | | IPv4         | UDP personalizado | UDP       | 2049                | 0.0.0.0/0      | Porta necessaria para utilizar o NFS |
| | | IPv4         | UDP personalizado | UDP       | 111                 | 0.0.0.0/0      | Porta necessaria para utilizar o NFS |
| | | IPv4         | TCP personalizado | TCP       | 111                 | 0.0.0.0/0      | Porta necessaria para utilizar o NFS |
| | | IPv4         | HTTP              | TCP       | 80                  | 0.0.0.0/0      | Permite conexao com protocolo HTTP   |
| | | IPv4         | HTTPS             | TCP       | 443                 | 0.0.0.0/0      | Permite conexao com protocolo HTTPS  |
| | | IPv4         | SSH               | TCP       | 22                  | **SEU IP**     | Permite conexao SSH para o seu IP    |
| | | IPv4         | NFS               | TCP       | 2049                | 0.0.0.0/0      | Porta necessaria para utilizar o NFS |


7. Clique em `Criar grupo de segurança`.

### Criação do seu par de chaves

1. Faça login no AWS Management Console e abra o console do Amazon EC2 em https://console.aws.amazon.com/ec2/.
2. No campo nome insira um nome descritivo.
3. Nas opções de Tipo de par de chaves e Formato de arquivo de chave privada pode deixar as opções padrão.
4. Clique em Criar par de chaves e salve o arquivo gerado.

### Criação da sua instância

Abra o console do Amazon EC2 em https://console.aws.amazon.com/ec2/.
1. No painel do console do EC2, clique em `Executar instância`.
2. Em `Nome e etiquetas`, em Name (Nome), insira um nome descritivo para a instância e adicione as seguintes tags para a instância e volume:

   Project: PB

   CostCenter: PBCompass
3. Em `Imagens de aplicação e de sistema operacional`, faça o seguinte:

    Escolha Início rápido e depois Amazon Linux. Este é o sistema operacional (SO) de sua instância.

4. Em `Tipo de instância`, escolha o tipo de instância t3.small.
5. Em `Par de chaves (login)`, escolha o par de chaves criado anteriormente.
6. Ao lado `Configurações de rede`, escolha `Editar`.
  - Em `VPC` selecione a VPC criada anteriormente.
  - Em `Sub-rede` selecione a sub-rede privada A.
  - Em `Firewall (grupos de segurança)` escolha `Selecionar um grupo de segurança existente` e escolha o grupo de segurança existente.
7. Em `Configurar armazenamento` crie um disco GP2 de 16GB.
8. Clique em `Detalhes avançados` e no campo `Dados do usuário` copie e cole o conteúdo do arquivo [user_data.sh](https://github.com/jofernando/compass-pb-atv-2/blob/main/scripts/user-data.sh)

Mantenha as seleções padrão para outras configurações de sua instância.

Revise um resumo da configuração da instância no painel `Resumo` e, quando você estiver pronto, escolha `Executar instância`.

Uma página de confirmação informa que sua instância está sendo executada. 

Pode levar alguns minutos até que a instância esteja pronta para sua conexão. Verifique se a instância foi aprovada nas verificações de status da coluna Status Checks (Verificações de status).

### Criação do seu ip elástico

Abra o console do Amazon EC2 em https://console.aws.amazon.com/ec2/.
1. No painel de navegação, escolha `Rede e segurança` e `IPs elásticos`.
2. Escolha `Alocar endereço IP elástico`.
3. Adicione as seguintes tags:

    Project: PB

    CostCenter: PBCompass.

4. Escolha `Alocar`.
5. No painel de navegação, escolha `Rede e segurança` e `IPs elásticos`.
6. Selecione o IP elástico criado, clique em `Ações` e `Associar endereço IP elástico`.
7. Em `Tipo de recurso` selecione instância.
8. Em `Instância` selecione a instância criada anteriormente.
9. Em `Endereço IP privado` selecione o endereço IP atríbuido a instância.
10. Clique em `Associar`

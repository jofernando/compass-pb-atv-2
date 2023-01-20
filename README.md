# Documentação da atividade sobre AWS e Linux

Jose Fernando Mendes da Costa

## Sumário

1. [Criação da sua VPC](https://github.com/jofernando/compass-pb-atv-2/#criação-da-sua-vpc)
2. [Criação do seu grupo de segurança](https://github.com/jofernando/compass-pb-atv-2/#criação-do-seu-grupo-de-segurança)

### Criação da sua VPC

Como criar sua VPC usando o Console de gerenciamento da AWS
1. Abra o console da Amazon VPC em https://console.aws.amazon.com/vpc/ (realize o login se não estiver logado).
2. Clique em `Criar VPC`.
3. Em Configurações da VPC, selecione `VPC e muito mais`.
4. Insira as seguintes informações:  
<dl>
  <dt>Gerar automaticamente</dt>
  <dd><code>JOSE</code></dd>
  
  <dt>Bloco CIDR IPv4</dt>
  <dd><code>10.0.0.0/16</code></dd>

  <dt>Bloco CIDR IPv6</dt>
  <dd><code>Nenhum bloco CIDR IPv6</code></dd>
  
  <dt>Locação</dt>
  <dd><code>Padrão</code></dd>
    
  <dt>Número de zonas de disponibilidade (AZs)</dt>
  <dd><code>3</code></dd>
  
  <dt>Número de sub-redes públicas</dt>
  <dd><code>3</code></dd>
  
  <dt>Número de sub-redes privadas</dt>
  <dd><code>0</code></dd>
  
  <dt>Gateways NAT (USD)</dt>
  <dd><code>Nenhuma</code></dd>
  
  <dt>Opções de DNS</dt>
  <dd><code>Habilitar nomes de host DNS</code></dd>
  <dd><code>Habilitar resolução de DNS</code></dd>
  
  <dt>Adicione as seguintes tags:</dt>
  <dd><code>Project: PB</code></dd>
  <dd><code>CostCenter: PBCompass</code></dd>
</dl>

5. Visualize como ficou sua VPC e se tudo estiver certo clique em `Criar VPC`.

### Criação do seu grupo de segurança

Como criar seu grupo de segurança usando o Console de gerenciamento da AWS  
1. Faça login no AWS Management Console e abra o console do Amazon EC2 em https://console.aws.amazon.com/ec2/.
2. No painel de navegação, selecione Grupos de segurança.
3. Escolha `Criar grupo de segurança`.
4. Em Detalhes básicos, insira um nome descritivo e uma breve descrição para o grupo de segurança.
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


Clique em `Criar grupo de segurança`.

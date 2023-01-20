# Documentação da atividade sobre AWS e Linux

Jose Fernando Mendes da Costa

## Sumário

1. [Criação da sua VPC](https://github.com/jofernando/compass-pb-atv-2/#criação-da-sua-vpc)

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

# tech-challenge-fase-4-cluster-eks

## Descrição
Criação do cluster EKS junto ao seus node groups, configurando nas subnets privadas.

Como recurso adicional, é realizada também a instalação do metrics-server, utilizando helm charts, para que as metricas sejam expostas e o autoscaling funcione corretamente.

**Tecnologia:** Terraform

## Pré-requisitos
- É necessário que a VPC tenha sido criada previamente a partir do repositório [tech-challenge-fase-4-vpc](https://github.com/leosaglia/tech-challenge-fase-4-vpc/actions/runs)
- É necessário que o repositório que realiza a criação das bases RDS tenha sido criado previamente a partir do repositório [tech-challenge-fase-4-database](https://github.com/leosaglia/tech-challenge-fase-4-database/actions/runs), pois ele também irá criar o security group e precisa dele para fazer a liberação do consumo do banco de dados.

## Workflow
Todo o deploy CI/CD é automatizado utilizado o github actions.

Segue o ***Github flow***. Possui a branch main protegida, com as alterações sendo realizadas em outras branchs, e quando concluídas, são mergeadas para main através de um PR (pull request).

- O workflow é definido em *.github/workflows/terraform.yml*.
- Configuração de credenciais AWS para acessar serviços e fazer deploy.
- Passos do Terraform - init, validate e plan - como ações de CI para iniciar, validar e planejar a infraestrutura que será deployada.
- Terraform apply após passar nos steps anteriores o o merge for efetivado para main.

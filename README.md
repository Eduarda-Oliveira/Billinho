# BILLINHO

## :checkered_flag: Índice :checkered_flag:
1. [Descrição](#descrição)
2. [Tecnologias utilizadas](#tecnologias)
3. [Instruções de uso](#instruções)
4. [Entidades](#entidades)

    1. [Instituição de Ensino](#subentidade1)
    2. [Aluno](#subentidade2)
    3. [Matrícula](#subentidade3)
    4. [Fatura](#subentidade4)
5. [Rotas](#rotas)
    1. [Instituição de Ensino](#subrota1)
    2. [Aluno](#subrota2)
    3. [Matrícula](#subrota3)
    4. [Fatura](#subrota4)

## :books: Descrição :books: <a name="descrição"></a>
<p align="justify"> O Billinho é sistema de gestão de mensalidades pagas por alunos à instituição de ensino em que ele estuda. </p>

## :computer: Tecnologias utilizadas :computer: <a name="tecnologias"></a>
- [Ruby](https://ruby-doc.org/): versão 2.7.0
- [Rails](https://guides.rubyonrails.org/): versão 5.2.4.4
- [Postman](https://www.postman.com/api-documentation-tool/)
- [Ubuntu](https://help.ubuntu.com/)
- [PostgreSQL](https://www.postgresql.org/docs/)

## :rocket: Instruções de uso :rocket: <a name="instruções"></a>
- No terminal, clone o projeto:
    - git clone https://github.com/Eduarda-Oliveira/Billinho.git
- Entre na pasta do projeto:
    - cd Billinho
- Instale as dependencias: 
    - bundle install
- Crie o banco de dados:
    - rails db:create
    - rails db:migrate
- Preencha o banco de dados:
    - rails db:seed
- Rode a aplicação
    - rails s
- Utilize o Postman para acessar a aplicação a partir da rota http://localhost:3000/
## :paperclip: Entidades :paperclip: <a name="entidades"></a>

### :pencil: Instituição de Ensino :pencil: <a name="subentidade1"></a>
| Campo   |      Tipo      |  Restrições |
|----------|:-------------:|------:|
| Nome |  Texto| Não pode estar vazio, único |
| CNPJ |    Texto   |   Apenas caracteres numéricos, único |
| Tipo | Texto |    Universidade, Escola ou Creche |

### :runner: Aluno :runner: <a name="subentidade2"></a>
| Campo   |      Tipo      |  Restrições |
|----------|:-------------:|------:|
| Nome |  Texto| Não pode estar vazio, único |
| CPF |    Texto   |  Não pode estar vazio, apenas caracteres numéricos, único|
| Data de nascimento | Data |    |
| Gênero |    Texto   |  Não pode estar vazio, M ou F|
| Meio de pagamento das faturas |    Texto   |  Não pode estar vazio, Boleto ou Cartão|

### :notebook: Matrícula :notebook: <a name="subentidade3"></a>
| Campo   |      Tipo      |  Restrições |
|----------|:-------------:|------:|
| Valor total curso em reais |  Decimal| Não pode estar vazio, >0|
| Quantidade de faturas |    Inteiro   |  Não pode estar vazio, >=1|
| Dia de vencimento das faturas |    Inteiro   |  Não pode estar vazio,>=1, <=31|
| Nome do curso |    Texto   |  Não pode estar vazio|
| ID da Instituição |    Chave Estrangeira    |  Não pode estar vazio|
| Id do Aluno |    Chave Estrangeira   |  Não pode estar vazio|
### :money_with_wings: Fatura :money_with_wings: <a name="subentidade4"></a>
| Campo   |      Tipo      |  Restrições |
|----------|:-------------:|------:|
| Valor fatura em reais |  Decimal| Não pode estar vazio|
| Data de vencimento |    Data   | Não pode estar vazio |
| ID da Matrícula | Chave Estrangeira | Não pode estar vazio |
| Status |    Texto   | Não pode estar vazio, Aberta (default), Atrasada ou Paga |

## :traffic_light: Rotas :traffic_light: <a name="rotas"></a>

### :pencil: Instituição de Ensino :pencil: <a name="subrota1"></a>
- Vizualizar todas as instituições
- GET localhost:3000/api/v1/instituicaos
- Retorno
```
{
    "status": "SUCCESS",
    "message": "Instituições de ensino carregadas",
    "data": [       
        {
            "id": 2,
            "nome": "West Bayer University",
            "cnpj": "50237080000252",
            "tipo": "Universidade",
            "created_at": "2020-12-03T22:44:49.399Z",
            "updated_at": "2020-12-03T22:44:49.399Z"
        },
        {
            "id": 1,
            "nome": "Baumbach Academy",
            "cnpj": "67110332000876",
            "tipo": "Universidade",
            "created_at": "2020-12-03T22:44:49.324Z",
            "updated_at": "2020-12-03T22:44:49.324Z"
        }
    ]
}
```
- Vizualizar instituição por ID
- GET localhost:3000/api/v1/instituicaos/2 
- Parâmetro necessário: ID da instituição
- Retorno
```
{
    "status": "SUCCESS",
    "message": "Instituição carregada",
    "data": {
        "id": 2,
        "nome": "West Bayer University",
        "cnpj": "50237080000252",
        "tipo": "Universidade",
        "created_at": "2020-12-03T22:44:49.399Z",
        "updated_at": "2020-12-03T22:44:49.399Z"
    }
}
```
- Adicionar instituição
- POST localhost:3000/api/v1/instituicaos (adicionar instituição)
- Parâmetros necessários: nome, tipo, cnpj
- Requisição
```
{
"nome" : "Anglo",
"cnpj" : "54189711000922", 
"tipo" : "Escola"
}
```
- Retorno
```
{
    "status": "SUCCESS",
    "message": "Saved instituicao",
    "data": {
        "id": 53,
        "nome": "Anglo",
        "cnpj": "54189711000922",
        "tipo": "Escola",
        "created_at": "2020-12-15T21:05:19.802Z",
        "updated_at": "2020-12-15T21:05:19.802Z"
    }
}
```
### :runner: Aluno :runner: <a name="subrota2"></a>
- Vizualizar todas os alunos
- GET localhost:3000/api/v1/alunos 
- Retorno
```
{
    "status": "SUCCESS",
    "message": "Alunos carregados",
    "data": [       
        {
            "id": 2,
            "nome": "Shara Senger",
            "cpf": "59643103451",
            "data_nascimento": "1996-03-28",
            "telefone_celular": 626546561,
            "genero": "M",
            "meio_pagamento_fatura": "Boleto",
            "created_at": "2020-12-03T22:44:49.394Z",
            "updated_at": "2020-12-03T22:44:49.394Z"
        },
        {
            "id": 1,
            "nome": "Dr. Magaret Grady",
            "cpf": "37538751446",
            "data_nascimento": "1942-07-16",
            "telefone_celular": 592688039,
            "genero": "F",
            "meio_pagamento_fatura": "Cartão",
            "created_at": "2020-12-03T22:44:49.311Z",
            "updated_at": "2020-12-03T22:44:49.311Z"
        }
    ]
}
```
- Vizualizar aluno por ID
- GET localhost:3000/api/v1/alunos/2 
- Parâmetro necessário: ID do aluno
- Retorno
```
{
    "status": "SUCCESS",
    "message": "Aluno carregado",
    "data": {
        "id": 1,
        "nome": "Dr. Magaret Grady",
        "cpf": "37538751446",
        "data_nascimento": "1942-07-16",
        "telefone_celular": 592688039,
        "genero": "F",
        "meio_pagamento_fatura": "Cartão",
        "created_at": "2020-12-03T22:44:49.311Z",
        "updated_at": "2020-12-03T22:44:49.311Z"
    }
}
```
- Adicionar aluno
- POST localhost:3000/api/v1/alunos?nome=Julia Amaral&cpf=654413579&data_nascimento=20000507&telefone_celular=123456745&genero=F&meio_pagamento_fatura=Boleto
- Parâmetros necessários: nome, cpf, data_nascimento, telefone_celular, mei_pagamento_fatura
- Retorno
```
{
    "status": "SUCCESS",
    "message": "Saved aluno",
    "data": {
        "id": 54,
        "nome": "Julia Amaral",
        "cpf": "654413579",
        "data_nascimento": "2000-05-07",
        "telefone_celular": 123456745,
        "genero": "F",
        "meio_pagamento_fatura": "Boleto",
        "created_at": "2020-12-15T21:14:35.831Z",
        "updated_at": "2020-12-15T21:14:35.831Z"
    }
}
```
### :notebook: Matrícula :notebook: <a name="subrota3"></a>
- Vizualizar todas as matrículas
- GET localhost:3000/api/v1/matriculas
- Retorno
```
{
    "status": "SUCCESS",
    "message": "Matriculas carregadas",
    "data": [       
                {
            "id": 2,
            "valor_total_reais": "4233.02268631478",
            "quantidade_faturas": 18,
            "dia_vencimento_faturas": 30,
            "nome_curso": "Engineering 428",
            "aluno_id": 2,
            "instituicao_id": 2,
            "created_at": "2020-12-03T22:44:49.403Z",
            "updated_at": "2020-12-03T22:44:49.403Z"
        },
        {
            "id": 1,
            "valor_total_reais": "4718.57606906062",
            "quantidade_faturas": 12,
            "dia_vencimento_faturas": 20,
            "nome_curso": "Creative Arts 280",
            "aluno_id": 1,
            "instituicao_id": 1,
            "created_at": "2020-12-03T22:44:49.341Z",
            "updated_at": "2020-12-03T22:44:49.341Z"
        }
    ]
}
```
- Vizualizar matrícula por ID
- GET localhost:3000/api/v1/matriculas/2
- Parâmetro necessário: ID da matrícula
- Retorno
```
{
    "status": "SUCCESS",
    "message": "Matricula carregada",
    "data": {
        "id": 2,
        "valor_total_reais": "4233.02268631478",
        "quantidade_faturas": 18,
        "dia_vencimento_faturas": 30,
        "nome_curso": "Engineering 428",
        "aluno_id": 2,
        "instituicao_id": 2,
        "created_at": "2020-12-03T22:44:49.403Z",
        "updated_at": "2020-12-03T22:44:49.403Z"
    }
}
```
- Adicionar matrícula e criar faturas
- POST localhost:3000/api/v1/matriculas
- Parâmetros necessários: valor_total_reais, quantidade_faturas, dia_vencimento_faturas, nome_curso, aluno_id, instituicao_id
- Requisição
```
{
"valor_total_reais" : 1555,
"quantidade_faturas" : 5, 
"dia_vencimento_faturas": 31,
"nome_curso" : "letras",
"aluno_id": 52,
"instituicao_id": 32
}
```
- Retorno
```
{
    "status": "SUCCESS",
    "message": "Saved matricula",
    "data": {
        "id": 186,
        "valor_total_reais": "1555.0",
        "quantidade_faturas": 5,
        "dia_vencimento_faturas": 31,
        "nome_curso": "letras",
        "aluno_id": 52,
        "instituicao_id": 32,
        "created_at": "2020-12-15T20:53:58.589Z",
        "updated_at": "2020-12-15T20:53:58.589Z"
    }
}
```
### :money_with_wings: Fatura :money_with_wings: <a name="subrota4"></a>
- Vizualizar todas as faturas
- GET localhost:3000/api/v1/faturas
- Retorno
```
        {
            "id": 2,
            "valor_fatura_reais": "393.214672421719",
            "data_vencimento": "2017-03-02",
            "status": "Paga",
            "matricula_id": 1,
            "created_at": "2020-12-03T22:44:49.358Z",
            "updated_at": "2020-12-03T22:44:49.358Z"
        },
        {
            "id": 1,
            "valor_fatura_reais": "393.214672421719",
            "data_vencimento": "2019-04-12",
            "status": "Aberta",
            "matricula_id": 1,
            "created_at": "2020-12-03T22:44:49.354Z",
            "updated_at": "2020-12-03T22:44:49.354Z"
        }
    ]
}
```
- Vizualizar fatura por ID
- GET localhost:3000/api/v1/faturas/1
- Parâmetro necessário: ID da fatura
- Retorno
```
{
    "status": "SUCCESS",
    "message": "Fatura carregada",
    "data": {
        "id": 1,
        "valor_fatura_reais": "393.214672421719",
        "data_vencimento": "2019-04-12",
        "status": "Aberta",
        "matricula_id": 1,
        "created_at": "2020-12-03T22:44:49.354Z",
        "updated_at": "2020-12-03T22:44:49.354Z"
    }
}
```
- Adicionar fatura
- POST localhost:3000/api/v1/faturas
- Parâmetros necessários: valor_fatura_reais, data_vencimento, matricula_id, status
- Requisição
```
{
"valor_fatura_reais": 600,
"data_vencimento": 20200303,
"matricula_id": 51,
"status": "Aberta"
}
```
- Retorno
```
{
    "status": "SUCCESS",
    "message": "Saved fatura",
    "data": {
        "id": 828,
        "valor_fatura_reais": "600.0",
        "data_vencimento": 20200303,
        "status": "Aberta",
        "matricula_id": 51,
        "created_at": "2020-12-15T21:48:38.261Z",
        "updated_at": "2020-12-15T21:48:38.261Z"
    }
}
```
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
| Nome | Texto | Não pode estar vazio, único |
| CNPJ | Texto | Apenas caracteres numéricos, único |
| Tipo | Texto | Universidade, Escola ou Creche |

### :runner: Aluno :runner: <a name="subentidade2"></a>
| Campo   |      Tipo      |  Restrições |
|----------|:-------------:|------:|
| Nome | Texto | Não pode estar vazio, único |
| CPF | Texto | Não pode estar vazio, apenas caracteres numéricos, único |
| Data de nascimento | Data |    |
| Telefone celular | Inteiro |    |
| Gênero | Texto | Não pode estar vazio, M ou F |
| Meio de pagamento das faturas | Texto | Não pode estar vazio, Boleto ou Cartão |

### :notebook: Matrícula :notebook: <a name="subentidade3"></a>
| Campo   |      Tipo      |  Restrições |
|----------|:-------------:|------:|
| Valor total curso em reais | Decimal| Não pode estar vazio, >0 |
| Quantidade de faturas | Inteiro | Não pode estar vazio, >=1 |
| Dia de vencimento das faturas | Inteiro | Não pode estar vazio,>=1, <=31 |
| Nome do curso | Texto |  Não pode estar vazio |
| ID da Instituição | Chave Estrangeira | Não pode estar vazio |
| Id do Aluno | Chave Estrangeira | Não pode estar vazio |
### :money_with_wings: Fatura :money_with_wings: <a name="subentidade4"></a>
| Campo   |      Tipo      |  Restrições |
|----------|:-------------:|------:|
| Valor fatura em reais | Decimal| Não pode estar vazio, >0 |
| Data de vencimento | Data | Não pode estar vazio |
| ID da Matrícula | Chave Estrangeira | Não pode estar vazio |
| Status | Texto | Não pode estar vazio, Aberta (default), Atrasada ou Paga |

## :traffic_light: Rotas :traffic_light: <a name="rotas"></a>

### :pencil: Instituição de Ensino :pencil: <a name="subrota1"></a>
- Vizualizar todas as instituições
- GET localhost:3000/api/v1/institutions
- Retorno
```
{
    "status": "SUCCESS",
    "message": "Institutions loaded",
    "data": [{
        "id": 2,
        "name": "Willms University",
        "cnpj": "52163281000792",
        "institution_type": "Escola",
        "created_at": "2021-01-04T22:26:09.339Z",
        "updated_at": "2021-01-04T22:26:09.339Z"
    },
    {
        "id": 1,
        "name": "Fatec salto",
        "cnpj": "13239055000109",
        "institution_type": "Creche",
        "created_at": "2021-01-03T19:51:39.350Z",
        "updated_at": "2021-01-04T19:30:45.754Z"
    }]
}
```
- Vizualizar instituição por ID
- GET localhost:3000/api/v1/institutions/1
- Parâmetro necessário: ID da instituição
- Retorno
```
{
    "status": "SUCCESS",
    "message": "Institution loaded",
    "data": {
        "id": 1,
        "name": "Fatec salto",
        "cnpj": "13239055000109",
        "institution_type": "Creche",
        "created_at": "2021-01-03T19:51:39.350Z",
        "updated_at": "2021-01-04T19:30:45.754Z"
    }
}
```
- Adicionar instituição
- POST localhost:3000/api/v1/institutions
- Parâmetros necessários: name, institution_type, cnpj
- Requisição
```
{
"name": "Fatec",
"cnpj": 13239155000109,
"institution_type": "Escola" 
}
```
- Retorno
```
{
    "status": "SUCCESS",
    "message": "Saved institution",
    "data": {
        "id": 32,
        "name": "Fatec",
        "cnpj": "13239155000109",
        "institution_type": "Escola",
        "created_at": "2021-01-04T22:42:44.392Z",
        "updated_at": "2021-01-04T22:42:44.392Z"
    }
}
```
- Excluir instituição por ID
- DELETE localhost:3000/api/v1/institutions/32
- Parâmetro necessário: ID da instituição
- Retorno
```
{
    "status": "SUCCESS",
    "message": "Deleted institution",
    "data": {
        "id": 32,
        "name": "Fatec",
        "cnpj": "13239155000109",
        "institution_type": "Escola",
        "created_at": "2021-01-04T22:42:44.392Z",
        "updated_at": "2021-01-04T22:42:44.392Z"
    }
}
```
- Atualizar instituição
- PUT localhost:3000/api/v1/institutions/51
- Parâmetros necessários: name/institution_type/cnpj, ID da instituição
- Requisição
```
{
"institution_type" : "Creche"
}
```
- Retorno
```
{
    "status": "SUCCESS",
    "message": "Updated institution",
    "data": {
        "id": 1,
        "institution_type": "Creche",
        "name": "Fatec salto",
        "cnpj": "13239055000109",
        "created_at": "2021-01-03T19:51:39.350Z",
        "updated_at": "2021-01-04T19:30:45.754Z"
    }
}
```
### :runner: Aluno :runner: <a name="subrota2"></a>
- Vizualizar todos os alunos
- GET localhost:3000/api/v1/students 
- Retorno
```
{
    "status": "SUCCESS",
    "message": "Students loaded",
    "data": [{
        "id": 2,
        "name": "Rafael Franecki",
        "cpf": "17195627900",
        "birth": "1942-09-24",
        "telephone": 214672115,
        "gender": "M",
        "payment_method": "Cartão",
        "created_at": "2021-01-04T22:26:09.326Z",
        "updated_at": "2021-01-04T22:26:09.326Z"
    },
    {
        "id": 1,
        "name": "Maria Oliveira",
        "cpf": "19072839005",
        "birth": "2000-05-07",
        "telephone": 1234567,
        "gender": "M",
        "payment_method": "Boleto",
        "created_at": "2021-01-03T19:51:34.811Z",
        "updated_at": "2021-01-04T20:12:02.891Z"
    }]
} 

```
- Vizualizar aluno por ID
- GET localhost:3000/api/v1/students/1 
- Parâmetro necessário: ID do aluno
- Retorno
```
{
    "status": "SUCCESS",
    "message": "Student loaded",
    "data": {
        "id": 1,
        "name": "Maria Oliveira",
        "cpf": "19072839005",
        "birth": "2000-05-07",
        "telephone": 1234567,
        "gender": "M",
        "payment_method": "Boleto",
        "created_at": "2021-01-03T19:51:34.811Z",
        "updated_at": "2021-01-04T20:12:02.891Z"
    }
}
```
- Adicionar aluno
- POST localhost:3000/api/v1/students
- Parâmetros necessários: name, cpf, birth, telephone, gender, payment_method
- Requisição:
```
{
"name": "Luciana Oliveira",
"cpf": 19072830005,
"birth": 20000507,
"telephone": 1234567,
"gender": "F",
"payment_method": "Boleto"
}
```
- Retorno
```
{
    "status": "SUCCESS",
    "message": "Saved student",
    "data": {
        "id": 32,
        "name": "Luciana Oliveira",
        "cpf": "19072830005",
        "birth": 20000507,
        "telephone": 1234567,
        "gender": "F",
        "payment_method": "Boleto",
        "created_at": "2021-01-05T00:46:24.478Z",
        "updated_at": "2021-01-05T00:46:24.478Z"
    }
}
```
- Excluir aluno por ID
- DELETE localhost:3000/api/v1/students/53
- Parâmetro necessário: ID da aluno
- Retorno
```
{
    "status": "SUCCESS",
    "message": "Deleted student",
    "data": {
        "id": 32,
        "name": "Luciana Oliveira",
        "cpf": "19072830005",
        "birth": "2000-05-07",
        "telephone": 1234567,
        "gender": "F",
        "payment_method": "Boleto",
        "created_at": "2021-01-05T00:46:24.478Z",
        "updated_at": "2021-01-05T00:46:24.478Z"
    }
}
```
- Atualizar aluno
- PUT localhost:3000/api/v1/students
- Parâmetros necessários: name/cpf/birth/telephone/gender/payment_method, ID do aluno
- Requisição
```
{
"gender" :"F"
}
```
- Retorno
```
{
    "status": "SUCCESS",
    "message": "Updated student",
    "data": {
        "id": 1,
        "gender": "F",
        "name": "Maria Oliveira",
        "cpf": "19072839005",
        "payment_method": "Boleto",
        "birth": "2000-05-07",
        "telephone": 1234567,
        "created_at": "2021-01-03T19:51:34.811Z",
        "updated_at": "2021-01-05T00:50:29.123Z"
    }
}
```
### :notebook: Matrícula :notebook: <a name="subrota3"></a>
- Vizualizar todas as matrículas
- GET localhost:3000/api/v1/enrollments
- Retorno
```
{
    "status": "SUCCESS",
    "message": "Enrollments loaded",
    "data":[{
        "id": 2,
        "full_value": "12345.0",
        "installments": 2,
        "due_day": 3,
        "course": "Communications",
        "student_id": 1,
        "institution_id": 1,
        "created_at": "2021-01-03T19:52:06.555Z",
        "updated_at": "2021-01-03T19:52:06.555Z"
    },
    {
        "id": 1,
        "full_value": "12345.0",
        "installments": 2,
        "due_day": 3,
        "course": "Communications",
        "student_id": 1,
        "institution_id": 1,
        "created_at": "2021-01-03T19:51:52.558Z",
        "updated_at": "2021-01-03T19:51:52.558Z"
    }]
}
```
- Vizualizar matrícula por ID
- GET localhost:3000/api/v1/enrollments/2
- Parâmetro necessário: ID da matrícula
- Retorno
```
{
    "status": "SUCCESS",
    "message": "Enrollment loaded",
    "data": {
        "id": 2,
        "full_value": "12345.0",
        "installments": 2,
        "due_day": 3,
        "course": "Communications",
        "student_id": 1,
        "institution_id": 1,
        "created_at": "2021-01-03T19:52:06.555Z",
        "updated_at": "2021-01-03T19:52:06.555Z"
    }
}
```
- Adicionar matrícula e criar faturas
- POST localhost:3000/api/v1/enrollments
- Parâmetros necessários: full_value, installments, due_day, course, student_id, institution_id
- Requisição
```
{
	"full_value": 10,
    "installments": 2,
    "due_day": 3,
    "course": "Communications",
    "student_id": 1,
    "institution_id": 1
}
```
- Retorno
```
{
    "status": "SUCCESS",
    "message": "Saved enrollment",
    "data": {
        "id": 45,
        "full_value": "10.0",
        "installments": 2,
        "due_day": 3,
        "course": "Communications",
        "student_id": 1,
        "institution_id": 1,
        "created_at": "2021-01-05T00:57:01.597Z",
        "updated_at": "2021-01-05T00:57:01.597Z"
    }
}
```
- Excluir matrícula e faturas por ID
- DELETE localhost:3000/api/v1/enrollments/197
- Parâmetro necessário: ID da matrícula
- Retorno
```
{
    "status": "SUCCESS",
    "message": "Deleted enrollments",
    "data": {
        "id": 197,
        "full_value": "1555.0",
        "installments": 5,
        "due_day": 31,
        "course": "letras",
        "student_id": 52,
        "institution_id": 31,
        "created_at": "2021-01-05T00:57:01.597Z",
        "updated_at": "2021-01-05T00:57:01.597Z"
    }
}
```
- Atualizar matrícula 
- PUT localhost:3000/api/v1/enrollments/2
- Parâmetros necessários: full_value/installments/due_day/course/student_id/institution_id, ID da matrícula
- Requisição
```
{
"institution_id": 1
}
```
- Retorno
```
{
    "status": "SUCCESS",
    "message": "Updated enrollment",
    "data": {
        "id": 2,
        "institution_id": 1,
        "full_value": "12345.0",
        "installments": 2,
        "due_day": 3,
        "course": "Communications",
        "student_id": 1,
        "created_at": "2021-01-03T19:52:06.555Z",
        "updated_at": "2021-01-03T19:52:06.555Z"
    }
}
```
### :money_with_wings: Fatura :money_with_wings: <a name="subrota4"></a>
- Vizualizar todas as faturas
- GET localhost:3000/api/v1/bills
- Retorno
```
{
    "status": "SUCCESS",
    "message": "Bills loaded",
    "data": [{
        "id": 2,
        "value": "5.0",
        "due_date": "2021-02-03",
        "status": "Aberta",
        "enrollment_id": 13,
        "created_at": "2021-01-04T19:18:14.696Z",
        "updated_at": "2021-01-04T19:18:14.696Z"
    },
    {
        "id": 1,
        "value": "5.0",
        "due_date": "2020-02-08",
        "status": "Atrasada",
        "enrollment_id": 5,
        "created_at": "2021-01-04T16:51:33.019Z",
        "updated_at": "2021-01-04T17:05:29.481Z"
    }]
}
```
- Vizualizar fatura por ID
- GET localhost:3000/api/v1/bills/1
- Parâmetro necessário: ID da fatura
- Retorno
```
{
    "status": "SUCCESS",
    "message": "Bill loaded",
    "data": {
        "id": 1,
        "value": "5.0",
        "due_date": "2020-02-08",
        "status": "Atrasada",
        "enrollment_id": 5,
        "created_at": "2021-01-04T16:51:33.019Z",
        "updated_at": "2021-01-04T17:05:29.481Z"
    }
}
```
- Adicionar fatura
- POST localhost:3000/api/v1/bills
- Parâmetros necessários: value, due_date, enrollment_id, status
- Requisição
```
{
"value": 5.0,
"due_date": 20200208,
"enrollment_id": 5,
"status": "Aberta"
}
```
- Retorno
```
{
    "status": "SUCCESS",
    "message": "Saved bill",
    "data": {
        "id": 422,
        "value": "5.0",
        "due_date": 20200208,
        "status": "Aberta",
        "enrollment_id": 5,
        "created_at": "2021-01-05T01:17:42.376Z",
        "updated_at": "2021-01-05T01:17:42.376Z"
    }
}
```
- Excluir fatura por ID
- DELETE localhost:3000/api/v1/bills/70
- Parâmetro necessário: ID da fatura
- Retorno
```
{
    "status": "SUCCESS",
    "message": "Deleted bill",
    "data": {
        "id": 70,
        "value": "69.8333752907063",
        "due_date": "2015-07-26",
        "status": "Aberta",
        "enrollment_id": 21,
        "created_at": "2021-01-04T22:26:09.737Z",
        "updated_at": "2021-01-04T22:26:09.737Z"
    }
}
```
- Atualizar fatura
- PUT localhost:3000/api/v1/bills/834
- Parâmetros necessários: value/due_date/enrollment_id/status, ID da fatura
- Requisição
```
{
"status": "Atrasada"
}
```
- Retorno
```
{
    "status": "SUCCESS",
    "message": "Updated bill",
    "data": {
        "id": 1,
        "status": "Atrasada",
        "value": "5.0",
        "due_date": "2020-02-08",
        "enrollment_id": 5,
        "created_at": "2021-01-04T16:51:33.019Z",
        "updated_at": "2021-01-04T17:05:29.481Z"
    }
}
```
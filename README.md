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

## :books: Descrição :books: <a name="descrição"></a>
<p align="justify"> O Billinho é sistema de gestão de mensalidades pagas po alunos à instituição de ensino em que ele estuda </p>

## :computer: Tecnologias utilizadas :computer: <a name="tecnologias"></a>
- [Ruby](https://ruby-doc.org/): versão 2.7.0
- [Rails](https://guides.rubyonrails.org/): versão 5.2.4.4
- [Postman](https://www.postman.com/api-documentation-tool/)
- [Ubuntu](https://help.ubuntu.com/)
- [PostgreSQL](https://www.postgresql.org/docs/)

## :rocket: Instruções de uso :rocket: <a name="tecnologias"></a>

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
The second paragraph text

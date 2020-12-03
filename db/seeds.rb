50.times do
    fatura = [6, 12, 18, 24].sample
    valorMatricula = Faker::Number.positive
    aluno = Aluno.create({
        nome: Faker::Name.name,
        cpf: Faker::Number.number(digits: 11),
        data_nascimento: Faker::Date.birthday(min_age: 17, max_age: 80),
        telefone_celular: Faker::Number.number(digits: 9),
        genero: ["M","F"].sample,
        meio_pagamento_fatura: ["Cartão","Boleto"].sample
    })
    instituicao = Instituicao.create({
        nome: Faker::University.name,
        cnpj: Faker::Company.brazilian_company_number(formatted: false),
        tipo: ["Universidade", "Escola", "Creche"].sample
    })
    matricula = Matricula.create({
        valor_total_reais: valorMatricula,
        quantidade_faturas: fatura,
        dia_vencimento_faturas: Faker::Number.between(from: 1, to: 31),
        nome_curso: Faker::Educator.course_name,
        instituicao: instituicao,
        aluno: aluno
    })
    fatura.times do
        Fatura.create({
            valor_fatura_reais: valorMatricula/ fatura,
            data_vencimento: Faker::Date.between(from: '2014-09-23', to: '2021-09-25'),
            status: ["Aberta", "Atrasada", "Paga"].sample,
            matricula: matricula
        }) 
    end
end
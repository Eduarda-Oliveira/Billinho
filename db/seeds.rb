50.times do
    Aluno.create({
        nome: Faker::Name.name,
        cpf: Faker::Number.number(digits: 11),
        data_nascimento: Faker::Date.birthday(min_age: 17, max_age: 80),
        telefone_celular: Faker::Number.number(digits: 11),
        genero: ["M","F"].sample,
        meio_pagamento_fatura: ["Cartão","Boleto"].sample
    })
end
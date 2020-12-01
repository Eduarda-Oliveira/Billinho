50.times do
    Aluno.create({
        nome: Faker::Name.name,
        cpf: Faker::Number.(digits: 11),
        genero:["M","F"].sample,
        meio_pagamento_fatura: ["Cartão","Boleto"].sample

    })
    Matricula.create({
        valor_total_reais

    })
end
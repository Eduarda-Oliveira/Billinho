30.times do
  bill = [6, 12, 18, 24].sample
  enrollmentFullValue = Faker::Number.positive
  student = Student.create({
                             name: Faker::Name.name,
                             cpf: Faker::Number.number(digits: 11),
                             birth: Faker::Date.birthday(min_age: 17, max_age: 80),
                             telephone: Faker::Number.number(digits: 9),
                             gender: %w[M F].sample,
                             payment_method: %w[Cartão Boleto].sample
                           })
  institution = Institution.create({
                                     name: Faker::University.name,
                                     cnpj: Faker::Company.brazilian_company_number(formatted: false),
                                     institution_type: %w[Universidade Escola Creche].sample
                                   })
  enrollment = Enrollment.create({
                                   full_value: enrollmentFullValue,
                                   installments: bill,
                                   due_day: Faker::Number.between(from: 1, to: 31),
                                   course: Faker::Educator.course_name,
                                   institution: institution,
                                   student: student
                                 })
  bill.times do
    Bill.create({
                  value: enrollmentFullValue / bill,
                  due_date: Faker::Date.between(from: '2014-09-23', to: '2021-09-25'),
                  status: %w[Aberta Atrasada Paga].sample,
                  enrollment: enrollment
                })
  end
end

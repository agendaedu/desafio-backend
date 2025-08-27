FactoryBot.define do
  factory :supplier do
    txt_fornecedor { Faker::Name.name }
    txt_cnpj_cpf { Faker::IDNumber.brazilian_citizen_number(formatted: true) }
  end
end

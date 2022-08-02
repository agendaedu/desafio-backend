FactoryBot.define do
  factory :deputy do
    txNomeParlamentar { Faker::Name.name }
    sgUF { %w[AC AL AP AM BA CE DF ES GO MA MT MS MG PA
    PB PR PE PI RN RS RO RR SC SP SE TO].sample }

    ideCadastro { Faker::Number.number(digits: 4) }
    cpf { Faker::IDNumber.brazilian_citizen_number(formatted: true) }
  end
end

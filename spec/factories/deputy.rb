FactoryBot.define do
  factory :deputy do
    tx_nome_parlamentar { Faker::Name.name }
    sg_uf { %w[AC AL AP AM BA CE DF ES GO MA MT MS MG PA
    PB PR PE PI RN RS RO RR SC SP SE TO].sample }

    id_cadastro { Faker::Number.number(digits: 4) }
    cpf { Faker::IDNumber.brazilian_citizen_number(formatted: true) }

    trait :with_expenditures do
      after(:create) do |deputy|
        create_list(:expenditure, 5, :with_supplier, deputy: deputy)
      end
    end
  end
end


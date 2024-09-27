FactoryBot.define do
  factory :deputy do
    tx_nome_parlamentar { Faker::Name.name }
    sg_uf { %w[AC AL AP AM BA CE DF ES GO MA MT MS MG PA
    PB PR PE PI RN RS RO RR SC SP SE TO].sample }

    id_cadastro { Faker::Number.number(digits: 4) }
    cpf { Faker::IDNumber.brazilian_citizen_number(formatted: true) }
  end
end

def deputy_with_expenditures(expenditures_count: 5)
  FactoryBot.create(:deputy) do |deputy|
    FactoryBot.create_list(:expenditure, expenditures_count,
                           deputy: deputy,
                           supplier: FactoryBot.create(:supplier))
  end
end

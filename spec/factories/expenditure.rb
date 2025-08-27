FactoryBot.define do
  factory :expenditure do
    txt_fornecedor { Faker::Name.name }
    vlr_liquido { Faker::Number.decimal(l_digits: 5, r_digits: 2) }
    data_emissao { Faker::Date.in_date_period }
    url_documento { Faker::Internet.url(host: 'example.com', path: '/foobar.html') }
    descricao { Faker::Fantasy::Tolkien.poem }

    trait :with_deputy do
      association :deputy, factory: :deputy
    end

    trait :with_supplier do
      association :supplier, factory: :supplier
    end
  end
end

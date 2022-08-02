FactoryBot.define do
  factory :expenditure do
    txt_fornecedor { Faker::Name.name }
    cnpj_cpf { Faker::IDNumber.brazilian_citizen_number(formatted: true) }
    vlr_liquido { Faker::Number.decimal(l_digits: 5, r_digits: 2) }
    data_emissao { Faker::Date.in_date_period }
    url_documento { Faker::Internet.url(host: 'example.com', path: '/foobar.html') }
    descricao { Faker::Fantasy::Tolkien.poem }
  end
end

def expenditure_with_deputy
  FactoryBot.create(:expenditure, deputy: FactoryBot.create(:deputy))
end
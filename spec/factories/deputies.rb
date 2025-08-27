FactoryBot.define do
  factory :deputy do
    name { "MyText" }
    unique_identifier { 1 }
    portfolio_number { 1 }
    legislature_number { 1 }
    uf_acronym { "MyText" }
    party_acronym { "MyText" }
    legislature_code { 1 }
    sub_quota_number { 1 }
    sub_quota_description { "MyText" }
    subquota_specification_number { 1 }
    subquota_specification_description { "MyText" }
  end
end

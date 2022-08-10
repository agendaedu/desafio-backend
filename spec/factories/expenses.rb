FactoryBot.define do
  factory :expense do
    cod_sub_quota { "MyString" }
    description { "MyText" }
    num_specification_sub_quota { "MyString" }
    description_specification { "MyString" }
    supplier { nil }
    congressman { nil }
  end
end

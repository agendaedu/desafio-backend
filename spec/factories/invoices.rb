FactoryBot.define do
  factory :invoice do
    num_invoice { "MyString" }
    document { "MyString" }
    issuance_date { "2022-08-10 10:41:23" }
    brute_value { "9.99" }
    gloss_value { "9.99" }
    liquid_value { "9.99" }
    month { "MyString" }
    year { "MyString" }
    num_quota { "MyString" }
    passenger { "MyString" }
    num_lot { "MyString" }
    patch { "MyString" }
    refund { "MyString" }
    restitution { "MyString" }
    expense { nil }
  end
end

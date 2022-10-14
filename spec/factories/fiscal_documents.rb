FactoryBot.define do
  factory :fiscal_document do
    supplier { "MyText" }
    cnpj { "MyText" }
    cpf { "MyText" }
    document_number { 1 }
    document_type { "MyText" }
    issue_date { "2022-10-12 16:50:21" }
    gloss_value { 1.5 }
    net_value { 1.5 }
    month { "MyText" }
    year { 1 }
    installment_number { 1 }
    passenger { "MyText" }
    segment { "MyText" }
    lot_number { 1 }
    reinbursement_number { 1 }
    refund_amount { 1.5 }
    deputy { nil }
  end
end

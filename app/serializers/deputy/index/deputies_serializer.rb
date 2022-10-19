class Deputy::Index::DeputiesSerializer < ActiveModel::Serializer
  attributes :id, :name, :deputy_photo, :cpf, :uf_acronym, :party_acronym, :sub_quota_number,
             :sub_quota_description, :expenses, :expenses_sum, :max_expense

  def expenses
    object.fiscal_documents.map do |fiscal_document|
      {
        issue_date: fiscal_document.issue_date,
        net_value: fiscal_document.net_value,
        supplier: fiscal_document.supplier,
        document_url: fiscal_document.document_url
      }
    end
  end

  def expenses_sum
    object.fiscal_documents.sum{|fiscal_document| fiscal_document[:net_value]}
  end

  def max_expense
    object.fiscal_documents.max_by{|fiscal_document| fiscal_document.net_value }[:net_value]
  end

  def deputy_photo
    "http://www.camara.leg.br/internet/deputado/bandep/#{object.unique_identifier}.jpg"
  end
end

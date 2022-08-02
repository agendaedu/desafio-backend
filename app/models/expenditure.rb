class Expenditure < ApplicationRecord
  validates :txt_fornecedor, :data_emissao, presence: true
  validates :cnpj_cpf, :vlr_liquido, :url_documento, presence: true

  # Relationship
  belongs_to :deputy
end

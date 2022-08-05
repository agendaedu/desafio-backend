class Supplier < ApplicationRecord
  validates :txt_fornecedor, presence: true
  validates :txt_cnpj_cpf, presence: true
end

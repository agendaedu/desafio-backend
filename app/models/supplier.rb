class Supplier < ApplicationRecord
  validates :txt_fornecedor, :txt_cnpj_cpf, presence: true
end

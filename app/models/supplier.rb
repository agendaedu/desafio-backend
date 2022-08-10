class Supplier < ApplicationRecord
  has_many :expenses, dependent: :destroy

  validates :cpf_cnpj, uniqueness: true
  validates :name, presence: true

  scope :from_cpf_cnpj, -> (cpf_cnpj) {
    where(cpf_cnpj: cpf_cnpj)
   }
end

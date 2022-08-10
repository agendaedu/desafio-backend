class Congressman < ApplicationRecord
  has_many :expenses, dependent: :destroy
  paginates_per 10

  validates :cpf, uniqueness: true

  scope :from_cpf, -> (cpf) {
    where(cpf: cpf)
   }
end

class Deputy < ApplicationRecord
  validates :txNomeParlamentar, presence: true
  validates :sgUF, presence: true
  validates :ideCadastro, presence: true, uniqueness: true
  validates :cpf, presence: true, uniqueness: true
end

class Deputy < ApplicationRecord
  validates :tx_nome_parlamentar, presence: true
  validates :sg_uf, presence: true
  validates :id_cadastro, presence: true, uniqueness: true
  validates :cpf, presence: true, uniqueness: true

  # Relationship
  has_many :expenditures
end

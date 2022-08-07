class Expenditure < ApplicationRecord
  validates :txt_fornecedor, :data_emissao, :vlr_liquido, :url_documento, presence: true

  after_save :expenditure_maximum
  # Relationship
  belongs_to :deputy
  belongs_to :supplier

  def expenditure_maximum
    self.deputy.update_column(:maior_despesa, deputy.expenditures.maximum(:vlr_liquido))
  end
end

class Expenditure < ApplicationRecord
  validates :txt_fornecedor, :data_emissao, :vlr_liquido, :url_documento, presence: true

  after_save :expenditure_maximum
  # Relationship
  belongs_to :deputy, optional: true
  belongs_to :supplier, optional: true

  def expenditure_maximum
    self.deputy.update_column(:maior_despesa, deputy.expenditures.maximum(:vlr_liquido))
  end
end

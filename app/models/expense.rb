class Expense < ApplicationRecord
  belongs_to :supplier
  belongs_to :congressman
  delegate :name, to: :supplier, prefix: true
  has_many :invoices, dependent: :destroy

  paginates_per 10
  
  scope :invoices_join, -> { 
    joins(:invoices)
  }
end

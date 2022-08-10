class Expense < ApplicationRecord
  belongs_to :supplier
  belongs_to :congressman
  has_many :invoices, dependent: :destroy
  paginates_per 10
  
  
end

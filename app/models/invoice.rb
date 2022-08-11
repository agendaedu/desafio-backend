class Invoice < ApplicationRecord
  belongs_to :expense
  has_many :documents, dependent: :destroy
end

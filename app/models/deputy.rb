class Deputy < ApplicationRecord
  has_many :fiscal_documents, dependent: :destroy
end

class Document < ApplicationRecord
  belongs_to :invoice
  paginates_per 10
end

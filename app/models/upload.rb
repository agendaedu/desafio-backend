class Upload < ApplicationRecord
  has_one_attached :csv_file
  paginates_per 10
end

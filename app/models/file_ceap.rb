class FileCEAP < ApplicationRecord
  validates :title, presence: true
  has_one_attached :avatar
end
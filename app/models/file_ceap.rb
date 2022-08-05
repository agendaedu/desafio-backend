class FileCeap < ApplicationRecord
  has_one_attached :avatar
  validates :title, presence: true
  validates :avatar, presence: true


  enum status: [ :processed, :unprocessed ]

end

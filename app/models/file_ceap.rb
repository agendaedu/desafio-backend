class FileCeap < ApplicationRecord
  has_one_attached :avatar
  validates :title, presence: true
  validates :avatar, presence: true

  # callbacks
  # after_create :process_file

  def process_file
    binding.remote_pry
    
  end
end

class FileCeap < ApplicationRecord
  has_one_attached :avatar
  validates :title, presence: true
  validates :avatar, presence: true

  enum status: [:unprocessed, :in_process, :processed]

  def self.status_attributes_for_select
    statuses.map do |status, _|
      [I18n.t("activerecord.attributes.#{model_name.i18n_key}.status.#{status}"), status]
    end
  end
end

class FileCeap < ApplicationRecord
  has_one_attached :avatar
  validates :title, :avatar, presence: true
  validate :correct_document_mime_type
  enum status: [:unprocessed, :in_process, :processed]

  def self.status_attributes_for_select
    statuses.map do |status, _|
      [I18n.t("activerecord.attributes.#{model_name.i18n_key}.status.#{status}"), status]
    end
  end

  private

  def correct_document_mime_type
    if avatar.attached? && !avatar.content_type.in?(%w(text/csv text/CSV))
      errors.add(:avatar, I18n.t(".format_invalid"))
    end
  end
end

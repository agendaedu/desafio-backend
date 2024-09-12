module FileCeapHelper
  def status(status)
    message = I18n.t("activerecord.attributes.file_ceap.status.#{status}")
    case status
    when 'processed'
      content_tag(:span, message, class: 'badge rounded-pill bg-success')
    when "unprocessed"
      content_tag(:span, message, class: 'badge rounded-pill bg-danger')
    when "in_process"
      content_tag(:span, message, class: 'badge rounded-pill bg-primary')
    end
  end
end

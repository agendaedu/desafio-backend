module ApplicationHelper
  def flash_class(level)
    case level
    when 'alert'
      'alert alert-warning alert-dismissible fade show'
    when 'notice'
      'alert alert-success alert-dismissible fade show'
    when 'error'
      'alert alert-danger alert-dismissible fade show'
    else
      'alert alert-primary alert-dismissible fade show'
    end
  end
end
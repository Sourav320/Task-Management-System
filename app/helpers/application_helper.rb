module ApplicationHelper
 def active_class(path)
    current_page?(path) ? "active" : ""
  end
  def bootstrap_class_for(flash_type)
    case flash_type.to_sym
    when :success
      "success"
    when :error
      "danger"
    when :alert
      "warning"
    when :notice
      "info"
    else
      "secondary"
    end
  end
end

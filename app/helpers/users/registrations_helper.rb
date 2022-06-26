module Users::RegistrationsHelper

  def error(object,name)
    return "" if !object.errors.any? && object.errors.messages[name].blank?

    error_message = ""
    object.errors.messages[name].each do |e|
      error_message += "#{name.to_s.camelize} #{e}<br>"
    end
    error_message.html_safe
  end

end

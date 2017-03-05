module DeviseHelper
  def devise_error_messages!
    return "" unless devise_error_messages?

    messages = []

    resource.errors.full_messages.each do |m|
      messages << content_tag(:div, class: 'flash__message') do
        content_tag(:span, 'error', class: 'flash__message__type') + 
        content_tag(:p, m, class: 'flash__message__text')
      end
    end

    sentence = I18n.t("errors.messages.not_saved",
                      :count => resource.errors.count,
                      :resource => resource.class.model_name.human.downcase)

    html = <<-HTML
      #{messages.join}
    HTML

    html.html_safe
  end

  def devise_error_messages?
    !resource.errors.empty?
  end

end

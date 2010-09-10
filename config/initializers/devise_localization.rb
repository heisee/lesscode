module DeviseHelper
  def devise_error_messages!
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = "#{pluralize(resource.errors.count, "")} Fehler gefunden:"

    html = <<-HTML
    <div id="error_explanation">
      <h3>#{sentence}</h3>
      <ul>#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end
end
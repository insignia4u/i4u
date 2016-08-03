class ErrorsDecorator < Draper::Decorator
  def initialize(resource)
    @html     = ""
    @resource = resource
  end

  def to_html
    build_message_box!
    h.content_tag(:div, @html.html_safe, class: "formErrors")
  end

protected
  def build_message_box!
    build_header
    build_message_list
  end

  def build_header
    action = @resource.new_record? ? "creating" : "updating"
    @html << h.content_tag(:h5, "There was a problem #{action} the #{entity_name}")
  end

  def build_message_list
    output = ""
    @resource.errors.full_messages.each do |error|
      output << h.content_tag(:li, error)
    end
    @html << h.content_tag(:ul, output.html_safe)
  end

  def entity_name
    @resource.class.name.humanize.downcase
  end
end

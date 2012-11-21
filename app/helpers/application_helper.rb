module ApplicationHelper
  def first_resource(collection, resource)
    resource == collection.first ? 'first' : ''
  end

  def last_resource(collection, resource)
    resource == collection.last ? 'last' : ''
  end

  def highlight_if_first(collection, resource)
    resource == collection.first ? 'highlighted' : ''
  end

  def snippet(text_snippet)
    @snippets ||= {}
    @snippets[text_snippet] ||= current_site.text_snippets.find_by_slug(text_snippet)
  end

  def title_for(text_snippet)
    rtn = text_snippet
    if ts = snippet(text_snippet)
      rtn = ts.title
    end

    rtn
  end

  def title_discriminated_for(text_snippet)
    text_snippet << (is_mobile_device? ? '-mobile-version' : '-pc-version')
    title_for(text_snippet)
  end

  def body_for(text_snippet, use_textilize, css_class='')
    rtn = nil
    if ts = snippet(text_snippet)
      rtn = use_textilize ? textilize(ts.body) : ts.body
      puts "="*50
      puts rtn
      puts "="*50
    end

    rtn.gsub('<p>',"<p class =#{css_class}>")
  end

  def body_discriminated_for(text_snippet, use_textilize, css_class='')
    text_snippet << (is_mobile_device? ? '-mobile-version' : '-pc-version')
    body_for(text_snippet, true, css_class)
  end

  def img_snippet_for(text_snippet, version)
    rtn = nil
    if ts = snippet(text_snippet) 
      if img = ts.image
        rtn = tag(:img, src: img.url(version), class: "twelve columns")
      end
    end

    rtn
  end

  def link_to_social_network(rs)
    content_tag(:a, rs.capitalize, href: "http://#{rs}.com/insignia4u",
      class: "#{rs} icon", target: "_blank")
  end

  def remove_protocol_from(url)
    url.gsub(/(http|https):\/\//, "")
  end

  def errors_for(object)
    object.errors.blank? ? "" : ErrorsDecorator.new(object).to_html
  end

end

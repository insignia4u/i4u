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

  def title_for(text_snippet)
    rtn = text_snippet
    if ts = current_site.text_snippets.find_by_slug(text_snippet)
      rtn = ts.title
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
end

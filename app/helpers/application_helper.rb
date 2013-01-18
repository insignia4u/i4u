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
    Rails.cache.fetch([current_site.id , text_snippet, "v1"], expires_in: 60.minutes) do
      current_site.text_snippets.find_by_slug(text_snippet)
    end
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
      ts.body ||= ''
      rtn = textilize(ts.body) if use_textilize
      rtn = rtn.gsub("<p>","<p class ='#{css_class}'>")
    end

    rtn
  end

  def body_discriminated_for(text_snippet, use_textilize, css_class='')
    text_snippet << (is_mobile_device? ? '-mobile-version' : '-pc-version')
    body_for(text_snippet, true, css_class)
  end

  def img_snippet_for(text_snippet, version, css_class='')
    rtn = nil
    if ts = snippet(text_snippet) 
      if ts.image?
        rtn = tag(:img, src: ts.image.url(version), class: css_class)
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

  def get_project_duration(project)
    ts_separator = title_for('to-separator-project-duration')

    rtn = l project.started_at, format: :long

    if project.ended_at
      rtn << " #{ts_separator} #{l project.ended_at, format: :long}"
    end

    rtn
  end

  def get_slider_to_highlighted_projects(projects)
    projects.map do |p|
      slider_hash(p.featured_image.url(:big), p.name, p.description)
    end
  end

  def clippy(text, bgcolor='#FFFFFF')
    html = <<-EOF
      <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"
              width="110"
              height="14"
              id="clippy" >
      <param name="movie" value="/flash/clippy.swf"/>
      <param name="allowScriptAccess" value="always" />
      <param name="quality" value="high" />
      <param name="scale" value="noscale" />
      <param NAME="FlashVars" value="text=#{text}">
      <param name="bgcolor" value="#{bgcolor}">
      <embed src="/flash/clippy.swf"
             width="110"
             height="14"
             name="clippy"
             quality="high"
             allowScriptAccess="always"
             type="application/x-shockwave-flash"
             pluginspage="http://www.macromedia.com/go/getflashplayer"
             FlashVars="text=#{text}"
             bgcolor="#{bgcolor}"
      />
      </object>
    EOF
  end
end

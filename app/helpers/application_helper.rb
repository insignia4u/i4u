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
    current_site.text_snippets.find_by_slug(text_snippet)
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
      rtn = rtn.gsub("<p>","<p class ='#{css_class}'>") unless css_class.blank?
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

  def link_to_social_network(rs, url)
    link = (url.present?)? url : "http://#{rs}.com/insignia4u"
    content_tag(:a, rs.capitalize, href: link, class: "social-link", target: "_blank") do
      content_tag(:i,nil,class: "icon-#{rs}")
    end
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

  def active_if_first(collection,item)
    if collection.first == item
      'active'
    else
      ''
    end
  end

  def active_if_equals(controller,name)
    'active' if controller == name
  end

  def add_class_number(collection,item)
    if collection.index(item) < 2
      'equal'
    else
      'equal2'
    end
  end

  def check_state(int)
    case int
    when 0
      'Draft'
    when 1
      'Published'
    end
  end

  def tip_type(tip)
    case tip.tip_type
    when Tip::RAILS_TIP
      'Rails Tips'
    when Tip::TODAY_TIP
      'Today Tips'
    else
      'All Tips'
    end
  end

  def tip_title(tip_type)
    case tip_type
    when Tip::RAILS_TIP
      'Rails Tips'
    when Tip::TODAY_TIP
      'Today Tips'
    else
      'All Tips'
    end
  end

  def facebook_share(post)
    return "http://www.facebook.com/sharer/sharer.php?" \
    "u=#{blog_article_url(post)}" if post
    ""
  end

  def twitter_share(post, summary)
    return "https://twitter.com/intent/tweet?" \
    "text=#{summary.truncate(139 - blog_article_url(post).length)}&" \
    "url=#{blog_article_url(post)}" if post
    ""
  end

  def google_share(post)
    return "https://plus.google.com/share?url=#{blog_article_url(post)}" if post
    ""
  end

  def linkedin_share(post, title, summary)
    return "http://www.linkedin.com/shareArticle?mini=true&" \
    "url=#{blog_article_url(post)}&" \
    "title=#{title}&summary=#{summary}&" \
    "source=Insignia Blog" if post
    ""
  end

  def tip_prev_year(type, date)
    blog_tips_path(type , month: 1, year: (@date - 1.year).year)
  end

  def tip_next_year(type, date)
    blog_tips_path(type , month: 1, year: (@date + 1.year).year)
  end

  def tip_month_name(month)
    Date::ABBR_MONTHNAMES[month].upcase
  end

  def tip_month_path(type, month, date)
    blog_tips_path(type, month: month, year: date.year)
  end

  def tip_month_class(month, date)
    return 'month-disable' if tip_inactive_month?(month, date)
    date.month==month ? 'month-current' : 'month-enable'
  end

  def tip_inactive_month?(month, date)
    date.year == Date.today.year && month > Date.today.month
  end

  def title(text)
    content_for :title, text
  end

end

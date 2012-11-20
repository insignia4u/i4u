class ApplicationController < ActionController::Base
  protect_from_forgery
  has_mobile_fu false

  before_filter :load_site

  def snippet(text_snippet)
    @snippet ||= {}
    @snippet[text_snippet] ||= current_site.text_snippets.find_by_slug(text_snippet)
  end
  helper_method :snippet

protected

  def current_site
    @current_site ||= Site.first
  end
  helper_method :current_site

  def load_site
    @current_site = Site.first
  end

end

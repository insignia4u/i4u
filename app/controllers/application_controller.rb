class ApplicationController < ActionController::Base
  protect_from_forgery
  has_mobile_fu false

  before_filter :load_site
  def slider_hash(image, name, text)
    {
      image: image,
      name:  name,
      text:  text
    }
  end

protected

  def current_site
    @current_site ||= Site.first
  end

  helper_method :current_site

  def load_site
    @current_site = Site.first
  end

end

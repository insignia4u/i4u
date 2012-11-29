class ApplicationController < ActionController::Base
  protect_from_forgery
  has_mobile_fu false

  helper_method :current_site
  def slider_hash(image, name, text)
    {
      image: image,
      name:  name,
      text:  text
    }
  end

protected

  def current_site
    language = session[:language] || "en"
    @current_site ||= Site.with_language(language.upcase).first
  end

end

class ApplicationController < ActionController::Base
  protect_from_forgery
  has_mobile_fu false

  expose(:subscriber)  { NewsletterSubscriber.new }

protected
  def current_site
    language = session[:language] || "en"
    @current_site ||= Site.with_language(language.upcase).first
  end
  helper_method :current_site
end

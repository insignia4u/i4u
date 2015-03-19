class ApplicationController < ActionController::Base
  protect_from_forgery
  has_mobile_fu false

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  expose(:subscriber)  { NewsletterSubscriber.new }

protected
  def current_site
    language = session[:language] || "en"
    @current_site ||= Site.with_language(language.upcase).first
  end
  helper_method :current_site

  def antispam!
    if cookies[:antispam]
      cookies.delete :antispam
    else
      return redirect_to(:back)
    end
  end

end

class ApplicationController < ActionController::Base
  protect_from_forgery
  has_mobile_fu false

[]
  helper_method :current_site
  helper_method :slider_hash

  def slider_hash(project)
    {
      image: { 
              normal:  project.image.url(:normal),
              medium:  project.image.url(:medium),
              small:   project.image.url(:small)
             },
      name:  project.name,
      text:  project.body
    }
  end

protected

  def current_site
    language = session[:language] || "en"
    @current_site ||= Site.with_language(language.upcase).first
  end

end

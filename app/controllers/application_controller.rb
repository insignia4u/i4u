class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :load_site

  protected

  def load_site
    @site = Site.first
  end
end

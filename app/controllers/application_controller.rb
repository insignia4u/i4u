class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :load_site

  protected

  def load_site
    @current_site = Site.first
  end

  def load_texts(texts)
    @text = []

    texts.each do |t|
      @text << TextSnippet.find(t)
    end

    @text
  end
end

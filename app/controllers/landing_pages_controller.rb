class LandingPagesController < ApplicationController
  layout "landing"

  expose(:message) { Message.new }
  expose(:projects) { current_site.landing_projects(@landing_page) }

  def index
    @landing_page = LandingPage.find_by_folder_and_slug!(params[:folder], params[:slug])
  end

  def show
    @landing_page = LandingPage.find_by_folder_and_slug!(params[:folder], params[:slug])
  end

end

class LandingPagesController < ApplicationController
  layout "landing"

  expose(:message) { Message.new }

  def index
    @landing_page = LandingPage.find_by_folder_and_slug!(params[:folder], params[:slug])
  end

end

class LandingPagesController < ApplicationController
  layout "landing"

  expose(:message) { Message.new(params[:message]) }

  def index
    @landing_page = LandingPage.find_by_folder_and_slug(params[:folder], params[:slug])
  end

end

class LandingPagesController < ApplicationController
  layout "landing"

  expose(:message) { Message.new(params[:message]) }

  def rails; end
end

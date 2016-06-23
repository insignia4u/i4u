class TrainingsController < ApplicationController
  layout "landing"

  expose(:message) { Message.new }

  def rails; end
end

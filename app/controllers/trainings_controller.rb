class TrainingsController < ApplicationController
  layout "landing"

  expose(:message) { Message.new }

  expose(:reservation) { Reservation.new }

  expose(:training)  { Training.find(params[:id]) }

  def rails; end

  def show;
  end

end

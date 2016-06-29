class ReservationController < ApplicationController
  expose(:reservation) { Reservation.new(params[:reservation]) }

  def new; end

  def create
    if reservation.send! and reservation.send_author!
      redirect_res_path = params[:to].present? ? params[:to] : reservation_path
      redirect_to redirect_res_path, notice: "Your message was successfully sent."
    else
      render :new
    end
  end
end
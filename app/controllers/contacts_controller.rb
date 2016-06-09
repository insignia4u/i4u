class ContactsController < ApplicationController
  expose(:message) { Message.new(params[:message]) }

  def new; end

  def create
    if message.send!
      redirect_path = params[:to].present? ? params[:to] : contact_path
      redirect_to redirect_path, notice: "Your message was successfully sent."
    else
      render :new
    end
  end
end

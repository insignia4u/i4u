class ContactsController < ApplicationController

  def new
    @message   = Message.new
  end

  def create
    @message = Message.new(message_params)

    if @message.valid?
      Notifier.contact_message(@message).deliver
      redirect_to new_contact_path, notice: "Your message was successfully sent."
    else
      render :new
    end
  end

private
  
  def message_params
    params.require(:message).permit(:name,:body,:email,:phone)
  end
end

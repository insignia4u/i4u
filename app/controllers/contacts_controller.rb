class ContactsController < ApplicationController

  def new
    @message = Message.new
    @main_text = TextSnippet.find('contact')
  end

  def create
    @message = Message.new(params[:message])

    if @message.valid?
      Notifier.contact_message(@message).deliver
      redirect_to root_path
    else
      render :new
    end
  end
end

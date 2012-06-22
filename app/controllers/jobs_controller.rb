class JobsController < ApplicationController

  def new
    @message = Message.new
    @main_text = TextSnippet.find('job')
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

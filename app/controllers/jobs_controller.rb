class JobsController < ApplicationController
  layout "jobs"

  def new
    @message = Message.new(is_to_job: true)
    @values = Value.all
  end

  def create
    @message = Message.new(params[:message])

    if @message.valid?
      Notifier.contact_message(@message).deliver
      redirect_to new_job_path, notice: "Your cv was successfully sent."
    else
      render :new
    end
  end
end

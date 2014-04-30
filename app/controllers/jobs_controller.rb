class JobsController < ApplicationController
  layout "jobs"

  def new
    @message   = Message.new(is_to_job: true)
    @testimony = Testimony.published
    @values    = Value.all
    @events    = Article.published.events.latest_first.limit(3)
  end

  def create
    @message = Message.build_with(params[:message])

    if @message.valid?
      Notifier.contact_message(@message).deliver
      redirect_to new_job_path, notice: "Your cv was successfully sent."
    else
      @testimony = Testimony.published
      @values    = Value.all
      @events    = Article.published.events.latest_first.limit(3)
      render :new
    end
  end
end

class JobsController < ApplicationController
  layout "jobs"

  def new
    @message   = Message.new
    @testimony = Testimony.published
    @values    = Value.all
    @events    = Article.published.events.latest_first.limit(3)
  end

  def create
    @message = Message.new(params[:message])

    if @message.send!
      redirect_to new_job_path, notice: "Your cv was successfully sent."
    else
      @testimony = Testimony.published
      @values    = Value.all
      @events    = Article.published.events.latest_first.limit(3)
      render :new
    end
  end
end

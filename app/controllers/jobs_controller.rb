class JobsController < ApplicationController
  before_filter :antispam!, only: [:create]

  layout "jobs"

  expose(:message)   { Message.new(params[:message]) }
  expose(:testimony) { Testimony.published }
  expose(:values)    { current_site.values.all }
  expose(:recent_events)    {
    current_site.articles.published.events.latest_first.limit(3)
  }

  def new; end

  def create
    message.is_to_job = true
    if message.send!
      redirect_to jobs_path, notice: "Your application was successfully sent."
    else
      render :new
    end
  end
end

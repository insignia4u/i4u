class TrainingsController < ApplicationController
  layout "landing"

  expose(:message) { Message.new }

  expose(:reservation) { Reservation.new }

  expose(:training)  { Training.friendly.find(params[:id]) }

  def rails; end

  def show; end

  def slug
    if training = Training.where(short_url: params[:slug]).first
      redirect_to training_url(training), status: :moved_permanently
    else
      if article = Article.where(short_url: params[:slug]).first
      	redirect_to blog_article_url(article), status: :moved_permanently
      else
      	redirect_to blog_path_url
      end
    end
  end

end

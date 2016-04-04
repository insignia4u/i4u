class SubscriptionsController < ApplicationController
  def create
    @success = subscriber.save

    if request.xhr?
      proccess_ajax_request
    else
      redirect_to root_url, :notice => "Gracias por tu subscripcion!"
    end
  end

private
  def subscriber
    @subscriber ||= NewsletterSubscriber.new(permitted_params)
  end

  def permitted_params
    params.require(:newsletter_subscriber).permit(:email)
  end

  def proccess_ajax_request
    if @success
      render json: subscriber, status: :created
    else
      render json: subscriber.errors, status: :unprocessable_entity
    end
  end
end

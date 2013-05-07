class NewsletterSubscriberController < ApplicationController

  def create
    @newsletter = NewsletterSubscriber.new(newsletter_subscriber_params)

    if @newsletter.save
      message = '<p>Successfully subscribed!</p>'
      errors  = false
    else
      message =  @newsletter.errors.first[1]
      errors  = true
    end

    render 'create', layout: false, locals: { errors: errors , message: message }
  end

private

  def newsletter_subscriber_params
    params.require(:newsletter_subscriber).permit(:email)
  end
end

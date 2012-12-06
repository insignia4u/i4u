class NewsletterSubscriberController < ApplicationController

  def create
    @newsletter = NewsletterSubscriber.new(params[:newsletter_subscriber])

    if @newsletter.save
      Notifier.successfull_subscription(@newsletter.email).deliver
      message = '<p>Successfully subscribed!!!!</p>'
      errors  = false
    else
      message =  @newsletter.errors.first[1]
      errors  = true
    end

    render 'create', layout: false, locals: { errors: errors , message: message }
  end
end

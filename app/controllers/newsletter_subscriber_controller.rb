class NewsletterSubscriberController < ApplicationController

  def create
    @newsletter = NewsletterSubscriber.new(params[:newsletter_subscriber])

    if @newsletter.save
      Notifier.successfull_subscription(@newsletter.email).deliver
      @message = '<p>Successfull subscription!!!</p>'
    else
      @message = '<ul>' + 
        @newsletter.errors.reduce('') { |html, error| html + "<li> #{error[1]}<\/li>" } +
        '</ul>'
    end

    render 'create', layout: false
  end
end

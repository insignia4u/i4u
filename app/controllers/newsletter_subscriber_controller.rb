class NewsletterSubscriberController < ApplicationController

  def create
    @newsletter = NewsletterSubscriber.new(params[:newsletter_subscriber])

    if @newsletter.save
      Notifier.successfull_subscription(@newsletter.email).deliver
      @message = '<p>Successfull subscription!!!</p>'
    else
      @message = '<ul>' + 
        @newsletter.errors.full_messages.reduce('') { |html, error| html + "<li> #{error}<\/li>" } +
        '</ul>'
    end

    render 'create', layout: false
  end
end

ActiveAdmin.register NewsletterSubscriber do
  filter :email

  actions :index

  member_action "resubscribe", method: :put do
    newsletter_subscriber = NewsletterSubscriber.find(params[:id])
    result = newsletter_subscriber.retry_mail_chimp_subscription
    message = (result == true) ?
      { notice: "This email was add to the mail chimp list!" } :
      { alert: result["error"] }

    redirect_to admin_newsletter_subscribers_path, message
  end

  index do
    column :email
    column "" do |newsletter_subscriber|
      unless newsletter_subscriber.on_mail_chimp_list?
        link_to "Reintentar subscripcion", resubscribe_admin_newsletter_subscriber_path(newsletter_subscriber), method: :put
      else
        "Subscripto"
      end
    end
  end
end

class AddColumnToNewsletterSubscribers < ActiveRecord::Migration
  def change
    
    add_index :newsletter_subscribers, :id
    add_column :newsletter_subscribers, :on_mail_chimp_list, :boolean, default: false
    add_index  :newsletter_subscribers, :email
  end
end

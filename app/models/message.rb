require 'valid_formats'

class Message
  include Virtus.model
  include ActiveModel::ForbiddenAttributesProtection
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend  ActiveModel::Naming

  attribute :is_to_job, Boolean
  attribute :body,      String
  attribute :email,     String
  attribute :name,      String
  attribute :phone,     String
  attribute :linked_in, String
  attribute :subject,   String
  attribute :file,      Paperclip::Attachment
  attribute :from_page,  String

  validates :body, :name, :email, presence: true
  validates :email, format: { with: ValidFormats::EMAIL, multiline: true }, allow_blank: true

  validates :file, presence: true, if: :is_to_job

  def send!
    return false unless valid?

    Notifier.contact_message(self).deliver
    true
  end

  def persisted?; false; end
  def new_record?; true; end
end

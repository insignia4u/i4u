require 'valid_formats'

class Message
  include Virtus.model
  include ActiveModel::Model

  attribute :is_to_job, Boolean
  attribute :body,      String
  attribute :email,     String
  attribute :name,      String
  attribute :phone,     String
  attribute :linked_in, String
  attribute :subject,   String
  attribute :file,      Paperclip::Attachment

  validates :body, :name, :email, presence: true
  # validates :email, format: { with: ValidFormats::EMAIL }, allow_blank: true

  validates :file, presence: true, if: :is_to_job

  def self.build_with(attrs)
    builder         = new(attrs)
    builder.subject = "CV to #{@name}" if builder.is_to_job

    builder
  end

  def persisted?
    false
  end

  #Used to be compatible with ErrorDecorator
  def new_record?
    true
  end
end

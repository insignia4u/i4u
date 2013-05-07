require 'valid_formats'

class Message
  include ActiveModel::ForbiddenAttributesProtection
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend  ActiveModel::Naming

  attr_accessor  :file, :is_to_job ,:body, :email, :name, :phone
  attr_reader :subject

  validates :body, :name, :email, presence: true
  validates :email, format: { with: ValidFormats::EMAIL }, allow_blank: true

  validates :file, presence: true, if: :is_to_job

  def initialize(attributes = {})
    @body      = attributes[:body]
    @name      = attributes[:name]
    @email     = attributes[:email]
    @phone     = attributes[:phone]
    @file      = attributes[:file]
    @is_to_job = (attributes[:is_to_job] == true || attributes[:is_to_job] == "true")
    @subject   = attributes[:subject]
    @subject   = 'Insignia website'

    if @is_to_job
      @subject = "CV to #{@name}"
    end

    self
  end

  def persisted?
    false
  end

  #Used to be compatible with ErrorDecorator
  def new_record?
    true
  end

end

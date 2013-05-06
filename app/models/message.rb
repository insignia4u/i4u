require 'valid_formats'

class Message
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend  ActiveModel::Naming

  attr_accessor :body, :email, :file, :name, :phone, :is_to_job
  attr_reader :subject

  validates :body, :name, :email, presence: true
  validates :email, format: { with: ValidFormats::EMAIL }, allow_blank: true

  validates :file, presence: true, if: :is_to_job
  validates :phone, presence: true, format: { with: ValidFormats::PHONE,
    message: "has an invalid format,
              please try something like this: 123456789"  }

  def initialize(attributes = {})
    @body      = attributes[:body]
    @name      = attributes[:name]
    @email     = attributes[:email]
    @phone     = sanitize_phone(attributes[:phone]) if attributes[:phone]
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

private

  def sanitize_phone(string)
    string.gsub(ValidFormats::PHONE) { "#{$1}#{$3}#{$4}" }
  end

end

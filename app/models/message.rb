require 'valid_formats'

class Message
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :name, :email, :body, :file, :subject

  validates :name, :email, :body, :subject, :presence => true
  validates :email, :format => { :with => ValidFormats::EMAIL }, :allow_blank => true

  def initialize(attributes = {})
    attributes.each { |name, value| send("#{name}=", value) }
  end

  def persisted?
    false
  end

  def new_record?
    true
  end
end
require 'valid_formats'

class Message
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :body, :email, :file, :name, :subject, :with_file

  validates :body, :name, :email, :subject, :presence => true
  validates :email, :format => { :with => ValidFormats::EMAIL }, :allow_blank => true
  validates :file, :presence => true, :if => :with_file

  def initialize(attributes = {})
    attributes.each { |name, value| send("#{name}=", value) }
  end

  def persisted?
    false
  end

  #Used to be compatible with ErrorDecorator
  def new_record?
    true
  end
end
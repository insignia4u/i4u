require 'valid_formats'

class Message
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :name, :email, :body, :file

  validates :name, :email, :body, :presence => true
  validates :email, :format => { :with => ValidFormats::EMAIL }, :allow_blank => true

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end
end
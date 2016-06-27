require 'valid_formats'

class Reservation
  include Virtus.model
  include ActiveModel::ForbiddenAttributesProtection
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend  ActiveModel::Naming

  attribute :name,      String
  attribute :email,     String
  attribute :phone,     String
  attribute :training,  String

  validates :name, :email, presence: true
  validates :email, format: { with: ValidFormats::EMAIL }, allow_blank: true

  def send!
    return false unless valid?

    Notifier.reservation_msg(self).deliver
    true
  end

  def send_author!
    return false unless valid?

    Notifier.reservation_author_msg(self).deliver
    true
  end

  def persisted?; false; end
  def new_record?; true; end
end
class Project
  module Validations
    extend ActiveSupport::Concern

    included do
      validates :site,                 presence: true
      validates :summary,              presence: true, length: {maximum: 120}
      validates :description,          presence: true
      validates :name,                 presence: true, uniqueness: { scope: :site_id }
      validates :url,                  presence: true, format: { with: ValidFormats::URL, multiline: true }

      validate  :validate_started_at_date_before_today
      validate  :validate_ended_at_date_after_started_at
    end

    def validate_started_at_date_before_today
      if started_at && started_at >= (DateTime.now - 1)
        errors.add(:started_at,
          "The start date can't be greater than the today!!")
      end
    end

    def validate_ended_at_date_after_started_at
      if ended_at
        if started_at.blank?
          errors.add(:ended_at,
            "Can't assign ended date for empty started date!")
        else
          if started_at >= ended_at
            errors.add(:ended_at,
              "The start date can't be greater than the ended date!")
          end
        end
      end
    end
  end
end

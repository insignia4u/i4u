class Project
  module Finders
    extend ActiveSupport::Concern

    included do
      scope :featured,        where(highlighted: true)
      scope :by_created_date, order("created_at DESC")
    end

    module ClassMethods

      def recent_jobs(n=4)
        order("created_at DESC").limit(n)
      end
    end
  end
end

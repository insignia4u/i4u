class Project
  module Finders
    extend ActiveSupport::Concern

    included do
      scope :featured, -> { where(highlighted: true) }
      scope :published,-> { where(published: true) }
      scope :by_created_date, -> { order("created_at DESC") }
    end

    module ClassMethods

      def recent_jobs
        published.order("created_at DESC")
      end
    end
  end
end

class Project
  module Featuring
    extend ActiveSupport::Concern

    def highlight!
      update_attributes(highlighted: true)
    end

    def unhighlight!
      update_attributes(highlighted: false)
    end

    def publish!
      update_attributes(published: true)
    end

    def unpublish!
      update_attributes(published: false)
    end

    def publish_state
      published? ? "Yes" : "No"
    end

    def highlight_state
      highlighted? ? "Yes" : "No"
    end
  end
end

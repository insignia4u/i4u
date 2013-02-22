class Project
  module Featuring
    extend ActiveSupport::Concern

    def highlight!
      update_attributes(highlighted: true)
    end

    def unhighlight!
      update_attributes(highlighted: false)
    end

    def highlight_state
      highlighted? ? "Yes" : "No"
    end
  end
end

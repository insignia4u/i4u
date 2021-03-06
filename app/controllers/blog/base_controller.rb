class Blog::BaseController < ApplicationController
  layout "blog"
  before_filter :shared_variables

  private
    def shared_variables
      @rails_tip  = Tip.rails_tip
      @today_tip  = Tip.today_tip
      @month_tips = Tip.month_tips(1.month.ago)
      @comment    = Comment.new
      @categories = Category.all
    end
end

class Blog::TipsController < ApplicationController
  before_filter :shared_variables

  def index
    if params[:date]
      @tips = Tip.month_tips(type, @date).page(params[:page]).per(10)
    else
      @tips = Tip.by_type(type).page(params[:page]).per(10)
    end
    @today_tip = (@tip_type === Tip::RAILS_TIP)? Tip.rails_tip : Tip.today_tip
  end

  private
    def type
      @tip_type = false
      @tip_type = Tip::RAILS_TIP if params[:type] == 'rails_tips'
      @tip_type = Tip::TODAY_TIP if params[:type] == 'today_tips'
      @tip_type
    end

    def shared_variables
      if params[:year] and params[:month]
        @date = Date.new(params[:year].to_i, params[:month].to_i)
      else
        @date = Date.today
      end
    end
end

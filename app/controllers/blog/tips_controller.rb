class Blog::TipsController < ApplicationController
  layout "blog"
  before_filter :set_date

  def index
    @tip_type = type
    @tips = Tip.month_tips(type, @date).page(params[:page]).per(2)
    @today_tip = (@tip_type === Tip::RAILS_TIP)? Tip.rails_tip : Tip.today_tip
  end

  private
    def type
      return Tip::RAILS_TIP if params[:type] == 'rails_tips'
      Tip::TODAY_TIP
    end

    def set_date
      @date = Date.today

      if params[:year]
        year  = params[:year].to_i.in?(@date.year-10..@date.year) ? params[:year].to_i : @date.year
        month = params[:month] && params[:month].in?('1'..'12') ? params[:month].to_i : 1

        @date = Date.new(year, month)
      end
    end
end

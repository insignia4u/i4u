module CalendarHelper
 def parse_regex(text)
    regex = /\{\{calendar(.*?)\}\}/
    reset_regex = /\{\{resetcounter(.*?)\}\}/
    new_text = text.gsub(regex) do |s|
      fechas = "#{s}".match(/\{\{calendar(.*?)\}\}/)[1].split(" ")
      dates = fechas.map{|f| Date.parse(f)}
      dates_by_month = dates.sort.group_by{|date| date.month}
      #starts counter for each group of months generated from 1 regex match
      rtn = "<div class='reset-calendar-counter'>"
      dates_by_month.each do |month, dates|
        rtn << <<-eos
          <div class='wrapper-calendar' data-month='#{month}'>
            <div class="hidden-dates">#{dates.map{|d| "#{d} "}.join}</div>
          </div>
        eos
      end
      #closes reset-calendar-counter div, restarting the counter
      rtn << <<-eos
        </div>
      eos
      rtn
    end

    regex1 = /\{\{training(.*?)\}\}/
    new_text1 = new_text.gsub(regex1) do |s|
      rest = "#{s}".match(/\{\{training(.*?)\}\}/)[1].split(" ")
      rtn = "<div class='banner clearfix'>"
        rtn << <<-eos
          <div class='class'><b>#{rest[0]} clases</b> de <b>#{rest[1]} hs</b> en <b>#{rest[2]} semanas</b></div>
          <div class='price clearfix'><div class='left'>#{rest[3]}</div><div class='off'>(#{rest[4]} OFF Contado Efectivo)</div></div>
        eos
      rtn << <<-eos
        </div>
      eos
      rtn
    end
  end
end

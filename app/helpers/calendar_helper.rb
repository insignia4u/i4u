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
  end
end

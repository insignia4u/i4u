module CalendarHelper
 def parse_regex(text)
    regex = /\{\{calendar(.*?)\}\}/
    text.gsub(regex)do |s|
      fechas = "#{s}".match(/\{\{calendar(.*?)\}\}/)[1].split(" ")
      dates = fechas.map{|f| Date.parse(f)}
      dates_by_month = dates.sort.group_by{|date| date.month}
      rtn = ''
      dates_by_month.each do |month, dates|
        puts month
        rtn << <<-eos
          <div class='wrapper-calendar' data-month='#{month}'>
            <div class="hidden-dates  sad#{i}">#{dates.map{|d| "#{d} "}.join}</div>
          </div>
        eos
      end
      rtn
    end
  end
end

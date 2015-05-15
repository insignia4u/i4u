module CalendarHelper
 def parse_regex(text)
    regex = /\{\{calendar(.*?)\}\}/
    text.gsub(regex)do |s|
      fechas = "#{s}".match(/\{\{calendar(.*?)\}\}/)[1].split(" ")
      puts "------------------"
      puts fechas
      dates = fechas.map{|f| Date.parse(f)}
      dates_by_month = dates.sort.group_by{|date| date.month}
      rtn = ''
      dates_by_month.each do |month, dates|
        rtn << <<-eos
          <div id='calendar' class='wrapper-calendar'>
            #{dates.map{|d| "<span>#{d.to_s(:db)}</span>"}.join}
          </div>
        eos
      end
      rtn
    end
  end
end


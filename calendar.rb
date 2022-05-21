require 'date'

 # It is dangeraous to initialize array elements with a proc or a lambda, 
    # This is because they could act like a closure that share a base object
    # causing it to overwrite itselt
    # I need to do more reading into this
    # Hence we initialize the map manually.
    # todo: need to look for other prgramatic initialization methods
    #  calendar = {
    #     0 => [' ',' ',' ',' ',' ',' ',' '],
    #     1 => [' ',' ',' ',' ',' ',' ',' '],
    #     2 => [' ',' ',' ',' ',' ',' ',' '],
    #     3 => [' ',' ',' ',' ',' ',' ',' '],
    #     4 => [' ',' ',' ',' ',' ',' ',' '],
    #     5 => [' ',' ',' ',' ',' ',' ',' ']
    # }
    # Manual initialization is also not effective
    # Method to use:
    # calendar = Hash.new {|cal, key| cal[key] = [' ',' ',' ',' ',' ',' ',' '] }

def cal(month, year)
    month = Date.new(year, month)
    first_wday = month.wday
    month_end = month.next_month - 1
    vertical_index = 0
    calendar = Hash.new {|cal, key| cal[key] = [' ',' ',' ',' ',' ',' ',' '] }
    (month..month_end).each do |day|
        wday = day.wday
        calendar[vertical_index][wday] = day.day
        vertical_index += 1 if wday == 6;
    end
    print "Su\t", "Mo\t", "Tu\t", "We\t", "Th\t", "Fr\t", "Sa\t\n"
    calendar.keys.sort.each do |item|
        calendar[item].each do |i|
            printf("%s\t", i)
        end
        puts
    end
end

cal(4, 2022)



def cal_solution_2(month, year)
    t = Time.new(year, month)
    month = Date.new(year, t.month)
    first_wday = month.wday
    month_end = month.next_month - 1
    calendar = {}
    (month..month_end).each do |day|
        wday = day.wday
        calendar[wday] = [] if calendar[wday] == nil
        calendar[wday].push(day.day)
       
    end
    calendar.each{|k,v| v.unshift " " if first_wday != 0 && k < first_wday}
    print "Su\t", "Mo\t", "Tu\t", "We\t", "Th\t", "Fr\t", "Sa\t\n"
    (0..5).each do |w|
        calendar.keys.sort.each do |item|
            printf("%s\t", calendar[item][w])
        end
        puts
    end
end

#  cal_solution_2(1, 2022)


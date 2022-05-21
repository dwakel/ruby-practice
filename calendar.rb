require 'date'

def cal(month, year)
    t = Time.new(year, month)
    month = Date.new(year, t.month)
    month_end = month.next_month - 1
    # puts month_end.day
    calendar = Array.new(5, [' ',' ',' ',' ',' ',' ',' '])
    vertical_index = 0
    print "Su\t", "Mo\t", "Tu\t", "We\t", "Th\t", "Fr\t", "Sa\t\n"
    (month.day..month_end.day).each do |day|
        case Date.new(year, t.month, day).wday
            when 0
                # print calendar[vertical_index]
                calendar[vertical_index][0] = day
            when 1
                # print day
                calendar[vertical_index][1] = day
            when 2
                # print day
                calendar[vertical_index][2] = day
            when 3
                # print day
                calendar[vertical_index][3] = day
            when 4
                # print day
                calendar[vertical_index][4] = day
            when 5
                # print day
                calendar[vertical_index][5] = day
            when 6
                calendar[vertical_index][6] = day
                vertical_index = vertical_index + 1
               
            else

            end
            
    end

    calendar.each do |item|
        item.each do |i|
            printf("%s\t", i)
        end
        puts
    end
    
end

cal(4, 2022)


# calendar = Array.new(5, [' ',' ',' ',' ',' ',' ',' '])


module DisposHelper
  # wdays is an array with the days of the week
   # to exclude (eg: [0,6] for sunday and saturday )

  def calculate_working_days(d1,d2,wdays)
        diff = d2 - d1
        holidays = 0
        ret = (d2-d1).divmod(7)
        holidays =  ret[0].truncate * wdays.length
        d1 = d2 - ret[1]
        while(d1 <= d2)
                if wdays.include?(d1.wday)
                        holidays += 1
                end
                d1 += 1
        end
        diff - holidays
   end
end

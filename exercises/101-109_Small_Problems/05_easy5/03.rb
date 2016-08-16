# As seen in the previous exercise, the time of day can be represented as the
# number of minutes before or after midnight. If the number of minutes is
# positive, the time is after midnight. If the number of minutes is negative,
# the time is before midnight.  Write two methods that each take a time of day
# in 24 hour format, and return the number of minutes before and after midnight,
# respectively. Both methods should return a value in the range 0..1439.  You
# may not use ruby's Date and Time methods.

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY

def after_midnight(time)
  hours, minutes = time.split(':').map(&:to_i)
  (hours * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY
end

# def before_midnight(time)
#   return 0 if time == '00:00'
#   time_arr = time.split(':')
#   hours = time_arr[0].to_i * MINUTES_PER_HOUR
#   minutes = time_arr[1].to_i
#   MINUTES_PER_DAY - (hours + minutes)
# end

def before_midnight(time)
  -after_midnight(time) % MINUTES_PER_DAY
end

puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0

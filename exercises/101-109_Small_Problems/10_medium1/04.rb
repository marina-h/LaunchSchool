# You have a bank of switches before you numbered from 1 to 1000. Each switch is
# connected to exactly one light that is initially off. You walk down the row of
# switches, and turn every one of them on. Then, you go back to the beginning
# and toggle switches 2, 4, 6, and so on. Repeat this for switches 3, 6, 9, and
# so on, and keep going until you have been through 1000 repetitions of this
# process.
#
# Write a program that determines how many lights are on at the end, and which
# lights are off.
#
# Example with 5 lights:
#
# round 1: every light is turned on
# round 2: lights 2 and 4 are now off; 1, 3, 5 are on
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
# The result is that 2 lights are left on, lights 1 and 4.
#
# With 10 lights, 3 lights are left on: lights 1, 4, and 9.

# 1 is on, 0 is off
def flip_switch(status)
  status.zero? ? 1 : 0
end

def switch_lights(n)
  light_status = Hash.new(0)
  1.upto(n) { |light| light_status[light] = 0 }
  1.upto(n) do |multiple|
    1.upto(n) do |i|
      light_status[i] = flip_switch(light_status[i]) if i % multiple == 0
    end
  end
  n_lights_on = light_status.values.reduce(:+)
  puts "With #{n} lights, #{n_lights_on} lights are left on."
end

switch_lights(10) # 3 lights are on; 1, 4, and 9

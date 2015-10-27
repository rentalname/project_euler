<<NOTE.!
  Problem 3 Largest prime factor

  The prime factors of 13195 are 5, 7, 13 and 29.

  What is the largest prime factor of the number 600851475143 ?
NOTE

require 'prime'

x = 600851475143

factors = []
takes = 10

while x != 1
  Prime.lazy.take(takes).each do |primer|
    r = x % primer
    if r == 0
      factors << primer
      x /= primer
    end
  end
  takes *= 2 if takes * 2 <= x
end

p factors
puts "A. #{factors.max}"

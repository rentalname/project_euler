<<~NOTE
  Problem 35 Circular primes

    The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.

    There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.

    How many circular primes are there below one million?

NOTE
require 'prime'

primes = Prime.each(1E6).to_a

primes.delete_if{|p| p.to_s =~ /[02468]/}

primes.unshift 2

c = 0
answer = primes.count do |prime|
  print "#{c+=1}\r"
  arr = prime.to_s.split('')
  arr.size.times do
    arr.unshift(arr.pop)
    if primes.include?(arr.join.to_i)
       true
    else
      break false
    end
  end
end

puts "A. #{answer}"

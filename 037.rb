<<~NOTE
  Problem 37 Truncatable primes

    The number 3797 has an interesting property.
    Being prime itself, it is possible to continuously remove digits from left to right, and

      remain prime at each stage:
        3797, 797, 97, and 7.
    Similarly we can work from right to

      left:
        3797, 379, 37, and 3.

    Find the sum of the only eleven primes that are both truncatable from left to right and right to left.

    NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
NOTE
require 'prime'

def trancates(num)
  s = num.to_s
  1.upto(s.length).flat_map do |i|
    next s[0, i], s[-i,i]
  end.map(&:to_i).uniq
end

primes = []
finds = []
Prime.each do |prime|
  primes << prime
  next if prime.to_s =~ /\d[24680]/
  if trancates(prime).all?{|n| primes.include?(n) }
    finds << prime
  end
  break if finds.size == 15
end

answer = (finds - [2,3,5,7]).inject(:+)

puts "A. #{answer}"

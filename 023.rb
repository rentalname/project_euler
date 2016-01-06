<<~NOTE
  Problem 23 Non-abundant sums

    A perfect number is a number for which the sum of its proper divisors is exactly equal to the number.
    For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

    A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.

    As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24.
    By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers.
    However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.

    Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.
NOTE

require 'set'

class Fixnum
  require 'prime'

  def factors
    set = Set[1]
    current = self
    Prime.each(self - 1) do |prime|
      div, mod = current.divmod(prime)

      if mod == 0
        set = set + set.map{|s| s * prime}
        if div == 1
          return set.to_a[0..-2]
        else
          current = div
          redo
        end
      else
        next
      end
    end || set
  end
end

abundants = [*1..20161].map do |n|
  abundant = n.factors.inject(:+)
  abundant > n ? n : 0
end.select(&:positive?)

x1 = Set[
  *abundants.repeated_combination(2).map do |a, b|
    a + b
  end
]

x2 = Set[*1..20161] - x1

answer = x2.to_a.inject(:+)

puts "A. #{answer}"

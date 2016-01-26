<<~NOTE
  Problem 41 Pandigital prime

    We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once.
    For example, 2143 is a 4-digit pandigital and is also prime.

    What is the largest n-digit pandigital prime that exists?
NOTE
require_relative 'lib/prime_ext'

finds = []

9.downto(3) do |to|
  [*1..to].reverse.permutation.lazy.each do |arr|
    next if arr[-1].even? || arr[-1] == 5

    target = arr.join.to_i
    if PrimeExt.miller_rabin_test?(target)
      finds << target
    end
  end

  break unless finds.empty?
end

answer = finds.max
puts "A. #{answer}"

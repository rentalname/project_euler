<<~NOTE
  Problem 32 Pandigital products

    We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once;
    for example, the 5-digit number, 15234, is 1 through 5 pandigital.

    The product 7254 is unusual, as the identity, 39 × 186 = 7254, containing multiplicand, multiplier,
    and product is 1 through 9 pandigital.

    Find the sum of all products whose multiplicand/multiplier/product
    identity can be written as a 1 through 9 pandigital.
    HINT: Some products can be obtained in more than one way so be sure to only include it once in your sum.
NOTE

require 'set'

set = Set.new
1.upto(101) do |i|
  puts "(#{i - 1}/100)"
  1.upto(10201) do |j|
    next if ((i%10) == 5 && j.even?) || (i.even? && (j%10) == 5)
    str = "#{i}#{j}#{i*j}"
    break if str.length > 9
    next if str =~ /0/
    set << i*j if str.length == 9 && str.each_char.to_a.uniq.size == 9
  end
end

sum = set.inject(:+)

puts "A. #{sum}"

<<~NOTE
  Problem 34 Digit factorials

    145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

    Find the sum of all numbers which are equal to the sum of the factorial of their digits.

    Note: as 1! = 1 and 2! = 2 are not sums they are not included.
NOTE

fx = {
  0 => 1,
  1 => 1,
  2 => 2,
  3 => [*2..3].inject(:*),
  4 => [*2..4].inject(:*),
  5 => [*2..5].inject(:*),
  6 => [*2..6].inject(:*),
  7 => [*2..7].inject(:*),
  8 => [*2..8].inject(:*),
  9 => [*2..9].inject(:*),
}

c = 0
sum = 0
3.upto(9999999) do |n|
  cn = n.to_s.each_char.map(&:to_i).inject(0){|m, i| m += fx[i]}
  sum += n if n == cn
  print "#{c += 1}/#{9999999/2**17}\r" if (n % 2**17) == 0
end

puts "A. #{sum}"

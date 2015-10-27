<<NOTE.!
  Problem 6 Sum square difference

  The sum of the squares of the first ten natural numbers is,
  1^2 + 2^2 + ... + 10^2 = 385

  The square of the sum of the first ten natural numbers is,
  (1 + 2 + ... + 10)^2 = 55^2 = 3025

  Hence the difference between the sum of the squares of the first ten natural numbers
  and the square of the sum is 3025 − 385 = 2640.

  Find the difference between the sum of the squares of the first one hundred natural numbers
  and the square of the sum.
NOTE

sum = [*1..100].inject(0) do |s, n|
  s += n**2
end

sq_sum = ([*1..100].inject(:+))**2

puts "A. #{sq_sum - sum}"

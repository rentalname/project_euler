<<NOTE.!
  Problem 9 Special Pythagorean triplet

  A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

  a^2 + b^2 = c^2

  For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

  There exists exactly one Pythagorean triplet for which a + b + c = 1000.
  Find the product abc.
NOTE

[*1..1000].combination(3).find do |a, b, c|
  (a + b + c == 1000) && (a**2 + b**2 == c**2)
end.tap{|a, b, c| puts "A. #{a * b * c}" }

<<NOTE.!
  Problem 15 Lattice paths

  Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down,
  there are exactly 6 routes to the bottom right corner.

  How many such routes are there through a 20×20 grid?
NOTE

class Fixnum
  def factorial
    [*1..self].inject(:*)
  end
end

s = 20

ans = (s * 2).factorial / s.factorial**2

puts "A. #{ans}"

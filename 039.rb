<<~NOTE
  Problem 39 Integer right triangles

    If p is the perimeter of a right angle triangle with integral length sides, {a,b,c},
    there are exactly three solutions for p = 120.

      {20,48,52}, {24,45,51}, {30,40,50}

    For which value of p ≤ 1000, is the number of solutions maximised?
NOTE

class Triangle < Array

  def initialize(a, b, c)
    @struct = [a, b, c]
  end

  def self.[](a, b, c)
    Triangle.new(*([a, b, c].sort))
  end

  def rat?
    a**2 + b**2 == c**2
  end

  def a
    @struct[0]
  end

  def b
    @struct[1]
  end

  def c
    @struct[2]
  end
end

answer = 3.upto(1000).max_by do |perim|
  puts "@#{perim}\r"
  sol = 0
  1.upto(perim) do |i|
    1.upto(perim - i) do |j|
      sol += 1 if Triangle[i,j,(perim - i - j)].rat?
    end
  end
  sol
end

puts "A. #{answer}"

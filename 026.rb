<<~NOTE
  Problem 26 Reciprocal cycles

    A unit fraction contains 1 in the numerator.
    The decimal representation of the unit fractions with denominators 2 to 10 are

    given:
      1/2  = 0.5
      1/3  = 0.(3)
      1/4  = 0.25
      1/5  = 0.2
      1/6  = 0.1(6)
      1/7  = 0.(142857)
      1/8  = 0.125
      1/9  = 0.(1)
      1/10 = 0.1

    Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle.
    It can be seen that 1/7 has a 6-digit recurring cycle.

    Find the value of d < 1000 for which 1/d contains the longest recurring cycle in its decimal fraction part.
NOTE

reci = 1.upto(1000).map do |d|
  n = 1
  dm = []
  loop do
    if n <= d
      n *= 10
      dm << [0, n]
    else
      x = n.divmod(d)
      n = x[1]
      if x[1] == 0
        break [d, 0]
      elsif dm.include?(x)
        break [d, dm[(dm.find_index(x) - 1)..-1].size]
      else
        dm << x
      end
    end
  end
end

answer = reci.max_by(&:last).first

puts "A. #{answer}"

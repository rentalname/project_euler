<<~NOTE
  Problem 40 Champernowne constant

    An irrational decimal fraction is created by concatenating the positive integers:

      0.123456789101112131415161718192021...

    It can be seen that the 12th digit of the fractional part is 1.

    If dn represents the nth digit of the fractional part, find the value of the following expression.

      d1 × d10 × d100 × d1000 × d10000 × d100000 × d1000000
NOTE

finds = []

search_points = 0.upto(6).map{|i| 10**i }
search_point = search_points.shift
pos = 0
1.upto(10**6) do |d|
  pos += (Math.log10(d) + 1).floor
  if pos >= search_point
    finds << d.to_s.reverse[pos - search_point]
    search_point = search_points.shift
  end
  break if search_point.nil?
end

answer = finds.map(&:to_i).inject(:*)

puts "A. #{answer}"

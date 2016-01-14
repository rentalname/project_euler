<<~NOTE
  Problem 36 Double-base palindromes

    The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.

    Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.

    (Please note that the palindromic number, in either base, may not include leading zeros.)
NOTE

def palindromic?(str)
  one_half = str[0, (str.length.to_r / 2).ceil]
  two_half = str[(str.length / 2)..-1]

  one_half == two_half.reverse
end

answer = 1.upto(1E6).select do |n|
  next if n % 10 == 0
  palindromic?(n.to_s) && palindromic?(n.to_s(2))
end.inject(:+)

puts "A. #{answer}"

<<NOTE.!
  Problem 4 Largest palindrome product

  A palindromic number reads the same both ways.
  The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

  Find the largest palindrome made from the product of two 3-digit numbers.
NOTE
require 'pry'
cand = []

[*100..999].repeated_combination(2).each do |a, b|
  x = (a * b).to_s
  if x.to_s[0..2] =~ /#{x.to_s[-3..-1].reverse}/
    cand << [x.to_i, a, b]
  end
end

p cand

puts "A. #{cand.max_by(&:first).first}"

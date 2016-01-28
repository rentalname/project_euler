<<~NOTE
  Problem 42 Coded triangle numbers

    The nth term of the sequence of triangle numbers is given by, tn = ½n(n+1); so

    the first ten triangle numbers are:
      1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

    By converting each letter in a word to a number corresponding to its alphabetical position and adding these values we form a word value.
    For example, the word value for SKY is 19 + 11 + 25 = 55 = t10.
    If the word value is a triangle number then we shall call the word a triangle word.

    Using [words.txt](https://projecteuler.net/project/resources/p042_words.txt), a 16K text file containing nearly two-thousand common English words, how many are triangle words?
NOTE
require 'open-uri'

class TriangleNumber
  def self.[](idx)
    return 1 if (idx) == 1

    self[idx - 1] + idx
  end
end

def word_value(str)
  str.each_char.map(&:ord).inject(:+) - (str.length * 64)
end

PROBLEM_FILE = "https://projecteuler.net/project/resources/p042_words.txt"
open(PROBLEM_FILE) do |file|
  body = file.read
  words = eval("[#{body}]")
  word_values = words.map{|w| word_value(w) }

  limit = word_values.max

  t_numbers = []
  n = 1
  while (tn = TriangleNumber[n]) < limit
    t_numbers << tn
    n += 1
  end

  answer = word_values.count{|v| t_numbers.include?(v) }

  puts "A. #{answer}"
end

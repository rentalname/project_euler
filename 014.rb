<<NOTE.!
  Problem 14 Longest Collatz sequence

  The following iterative sequence is defined for the set of positive integers:

  n → n/2 (n is even)
  n → 3n + 1 (n is odd)

  Using the rule above and starting with 13, we generate the following sequence:

    13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1

  It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

  Which starting number, under one million, produces the longest chain?

  NOTE: Once the chain starts the terms are allowed to go above one million.
NOTE

class Fixnum
  def even?
    self % 2 == 0
  end
end

chains = []
current = 1
# while curren < 1_000_000
5E5.to_i.upto(1E6.to_i) do |n|
  current = n
  chain = 0
  while current < 1_000_000
    if [2,6,0].include?(current % 10)
      current /= 2
    else
      current = 3 * current + 1
    end
    chain += 1
  end
  chains << chain
  p chain
end

puts "A. #{chains.max}"

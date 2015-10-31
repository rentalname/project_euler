<<NOTE.!
  Problem 14 Longest Collatz sequence

  The following iterative sequence is defined for the set of positive integers:

  n → n/2 (n is even)
  n → 3n + 1 (n is odd)

  Using the rule above and starting with 13, we generate the following sequence:

    13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1

  It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms.
  Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

  Which starting number, under one million, produces the longest chain?

  NOTE: Once the chain starts the terms are allowed to go above one million.
NOTE

class Fixnum
  def even?
    self % 2 == 0
  end

  def odd?
    !even?
  end
end

memoiz = Hash[1, 1]

1.upto(1_000_000) do |n|
  current = n
  chain = 0
  loop do
    if memoiz[current]
      memoiz[n] = memoiz[current] + chain
      break
    else
      if current.odd?
        current = (current * 3 + 1)
      else
        current /= 2
      end
      chain += 1
    end
  end

  print "|#{'=' * (n / 100_000 )}>|\r"
end

ans = memoiz.values.max

puts
puts "A. #{ans}"

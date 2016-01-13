<<~NOTE
  Problem 33 Digit cancelling fractions

    The fraction 49/98 is a curious fraction, as an inexperienced mathematician in attempting to simplify it may incorrectly believe that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.

    We shall consider fractions like, 30/50 = 3/5, to be trivial examples.

    There are exactly four non-trivial examples of this type of fraction, less than one in value, and containing two digits in the numerator and denominator.

    If the product of these four fractions is given in its lowest common terms, find the value of the denominator.
NOTE

ar = []
10.upto(99) do |nu|
  next if (nu % 11) == 0

  a1,a2 = nu.divmod(10)
  next if a2 == 0
  10.upto(99) do |de|
    b1,b2 = de.divmod(10)
    x = [a1,a2]
    y = [b1,b2]

    if (x - y | y - x).length == 2
      c1 = (x - y)[0]
      c2 = (y - x)[0]
      next if c2.zero?
      if (nu.to_r / de) == (c1.to_r / c2) && (c1.to_r / c2) < 1
        ar << (c1.to_r / c2)
      end
    end
  end
end

answer = ar.inject(:*).denominator

puts "A. #{answer}"

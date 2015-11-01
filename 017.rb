<<NOTE.!
  Problem 17 Number letter counts

  If the numbers 1 to 5 are written out in
  words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

  If all the numbers
  from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?

  NOTE:
    Do not count spaces or hyphens.
    For example, 342 (three hundred and forty-two) contains 23 letters
    and 115 (one hundred and fifteen) contains 20 letters.
    The use of "and" when writing out numbers is in compliance with British usage.
NOTE

Letter = Hash[
  1,    :One,
  2,    :Two,
  3,    :Three,
  4,    :Four,
  5,    :Five,
  6,    :Six,
  7,    :Seven,
  8,    :Eight,
  9,    :Nine,
  10,   :Ten,
  11,   :Eleven,
  12,   :Twelve,
  13,   :Thirteen,
  14,   :Fourteen,
  15,   :Fifteen,
  16,   :Sixteen,
  17,   :Seventeen,
  18,   :Eighteen,
  19,   :Nineteen,
  20,   :Twenty,
  30,   :Thirty,
  40,   :Forty,
  50,   :Fifty,
  60,   :Sixty,
  70,   :Seventy,
  80,   :Eighty,
  90,   :Ninety,
  100,  :Hundred,
  1000, :Thousand,
]

ans = 1.upto(11).inject(0) do |c, n|
  d1, m1 = n.divmod(1000)
  d2, m2 = m1.divmod(100)
  d3, m3 = m2.divmod(10)

  if d1 > 0
    c += Letter[1000].size
  end

  if d1 > 0 || d2 > 0
    c += 'and'.size
  end

  if d2 > 0
    c += Letter[d2].size
    c += Letter[100].size
  end

  if Letter[m2]
    c += Letter[m2].size
  else
    if d3 > 0
      c += Letter[d3 * 10].size
    end
    if m3 > 0
      c += Letter[m3].size
    end
  end
end

puts "A. #{ans}"

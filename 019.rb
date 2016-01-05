<<NOTE.!
  Problem 19 Counting Sundays

    You are given the following information, but you may prefer to do some research for yourself.

    1 Jan 1900 was a Monday.
    Thirty days has September,
    April, June and November.
    All the rest have thirty-one,
    Saving February alone,
    Which has twenty-eight, rain or shine.
    And on leap years, twenty-nine.
    A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.

    How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?
NOTE

def leap?(year)
  (year % 4 == 0) && (year % 400 != 0)
end

def sunday?(wday)
  wday % 7 == 0
end

days_at_month = {
   1 => proc{ 31 },
   2 => proc{|y| leap?(y) ? 29 : 28 },
   3 => proc{ 31 },
   4 => proc{ 30 },
   5 => proc{ 31 },
   6 => proc{ 30 },
   7 => proc{ 31 },
   8 => proc{ 31 },
   9 => proc{ 30 },
  10 => proc{ 31 },
  11 => proc{ 30 },
  12 => proc{ 31 }
}

c = 2
sunday_count = 0
1901.upto(2000) do |year|
  1.upto(12) do |mon|
    if sunday?(c)
      sunday_count += 1
    end
    c += days_at_month[mon][year]
  end
end

puts "A. #{sunday_count}"

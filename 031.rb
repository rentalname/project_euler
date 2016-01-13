<<~NOTE
  Problem 31 Coin remains

    In England the currency is made up of pound, £, and pence, p, and there are eight coins in general

      circulation:
        1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).

    It is possible to make £2 in the following

      way:
        1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p

    How many different ways can £2 be made using any number of coins?
NOTE
require 'set'

set = Set.new

extra_count = 8 # 一種類のコインのみからなるパターン

0.upto(1) do |c6|               # 100
  0.upto(3) do |c5|             # 50
    break if c5 > 2 && c6 >= 1
    0.upto(9) do |c4|           # 20
        puts "(#{(c6*40+c5*10+c4)}/80) / find: #{set.size}"
        break if c4 > 5 && c5 > 2
      0.upto(19) do |c3|        # 10
          break if c3 > 10 && c4 > 5
        0.upto(39) do |c2|      # 5
          break if c2 > 20 && c3 > 10
          0.upto(99) do |c1|    # 2
              break if c1 > 50 && c2 > 20
            0.upto(199) do |c0| # 1
              break if c0 > 100 && c1 > 50 && (c2 + c0).odd?
              if (c0 * 1 + c1 * 2 + c2 * 5 + c3 * 10 + c4 * 20 + c5 * 50 + c6 * 100) == 200
                set << [c0, c1, c2, c3, c4, c5, c6]
              end
            end
          end
        end
      end
    end
  end
end

answer = set.size + extra_count

puts "A. #{answer}"

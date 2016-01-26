require_relative 'math_ext'
require 'prime'
require 'set'

class PrimeExt < Prime
  def self.miller_rabin_test?(num)
    return true if [1,2].include?(num)
    return false if num.even?
    return Prime.prime?(num) if num < 1000

    d = num - 1
    s = 0
    while d.even?
      s += 1
      d >>= 1
    end

    choices = Set[]
    while choices.size <= 100
      choices << rand(num - 1) + 1
    end

    # 合成数であることの証拠が一つも見つからなかった場合, たぶん素数である
    choices.none? do |a|
      # 乱択値aについて合成数であることの証拠を探す
      if Math.modpow(a, d, num) != 1
        [*0...s].all? do |r|
          Math.modpow(a, 2**r * d, num) != num - 1
        end
      end
    end
  end
end

# Prime.each(2000).reject{|n| n < 1000}.sample(10).each do |prime|
#   puts "#{prime} => get: #{PrimeExt.miller_rabin_test?(prime)} | expect: true"
# end
#
# ([*1000..2000] - Prime.each(2000).reject{|n| n < 1000}).sample(10).each do |composit|
#   puts "#{composit} => get: #{PrimeExt.miller_rabin_test?(composit)} | expect: false"
# end

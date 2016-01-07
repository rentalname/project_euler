<<~NOTE
  Problem 27 Quadratic primes

    Euler discovered the remarkable quadratic

    formula:
      n² + n + 41

    It turns out that the formula will produce 40 primes for the consecutive values n = 0 to 39.
    However, when n = 40, 402 + 40 + 41 = 40(40 + 1) + 41 is divisible by 41,
    and certainly when n = 41, 41² + 41 + 41 is clearly divisible by 41.

    The incredible formula  n² − 79n + 1601 was discovered, which produces 80 primes for the consecutive values n = 0 to 79.
    The product of the coefficients, −79 and 1601, is −126479.

    Considering quadratics of the

    form:
      n² + an + b, where |a| < 1000 and |b| < 1000

      where |n| is the modulus/absolute value of n
      e.g. |11| = 11 and |−4| = 4

    Find the product of the coefficients, a and b, for the quadratic expression that produces the maximum number of primes for consecutive values of n, starting with n = 0.
NOTE

require 'prime'

bs = Prime.each(1000).to_a
as = bs + bs.map{|n| -n}
pairs = as.product(bs)

phase = 0
answer = loop do
  phase += 1
  eval <<~EVAL
    def assert_#{phase}(a, b)
      (#{phase}**2 + a * #{phase} + b).prime?
    end
  EVAL

  pairs.select! do |a, b|
    send("assert_#{phase}", a, b)
  end

  break pairs[0].inject(:*) if pairs.size == 1
end

puts "A. #{answer}"

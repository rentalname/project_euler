module Math

  #@see https://ja.wikipedia.org/wiki/%E5%86%AA%E5%89%B0%E4%BD%99
  def self.modpow(base, exp, mod)
    result = 1

    while exp > 0
      result = (result * base) % mod if ((exp & 1) == 1)
      exp >>= 1
      base = (base**2) % mod
    end

    result
  end
end

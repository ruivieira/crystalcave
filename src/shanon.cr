require "math"

def shanon(str : String) : Float64
  count = {} of Char => Int32
  str.each_char { |c| if count.has_key?(c)
    count[c] += 1
  else
    count[c] = 1
  end }

  -1.0 * count.values.map {|z| z.to_f}.map { |v| v/str.size * Math.log2(v/str.size) }.reduce {|acc, i| acc + i}
end

puts("Shanon entropy:")

puts("H(crystal) = #{shanon("crystal")} (should be 2.087")
puts("H(http://ruivieira.org) = #{shanon("http://ruivieira.org")} (should be 3.646)")
puts("H(3.14159265359) = #{shanon("3.14159265359")} (should be 2.873)")

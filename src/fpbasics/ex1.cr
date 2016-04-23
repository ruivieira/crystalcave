require "math"

EPSILON = 1e-10

def findRoot(low : Float64, high : Float64, f : Float64 -> Float64)
  mid = 0.5 * (low + high)
  fl = f.call(low)
  fm = f.call(mid)
  if (fm.abs < EPSILON || high - low < EPSILON)
    mid
  else
      if (fl * fm > 0.0)
        findRoot(mid, high, f)
      else
        findRoot(low, mid, f)
      end
  end
end

puts("#{findRoot(-10.0, 10.0, ->(x : Float64) { x + 1.0 })} == -1")
puts("#{findRoot(-5.0, 10.0, ->(x : Float64) { 2.0 - x })} == 2")
puts("#{findRoot(0.0, 5.0, ->(x : Float64) { x - 1.0 })} == 1")
puts("#{findRoot(0.0, 2.0, ->(x : Float64) { (x + 1.0) * (x - 1.0) })} == 1")
puts("#{findRoot(-2.0, 0.0, ->(x : Float64) { (x + 1.0) * (x - 1.0) })} == -1")
puts("#{findRoot(0.0, 2.0, ->(x : Float64) { x * x - 2.0 })} == math.sqrt(2)")

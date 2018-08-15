require_relative '../lib/vector'
require_relative '../lib/line'

a = Line.new(Vector.new([4.046, -2.836]), 1.21)
b = Line.new(Vector.new([10.115, 7.09]), 3.025)
c = Line.new(Vector.new([7.204, 3.182]), 8.68)
d = Line.new(Vector.new([8.172, 4.114]), 9.883)
e = Line.new(Vector.new([1.182, 5.562]), 6.744)
f = Line.new(Vector.new([1.773, 8.343]), 9.525)

[[a, b], [c, d], [e, f]].each do |v1, v2|
  p "#{v1.intersection(v2)} #{v1.parallel?(v2)} #{v1.coincidental?(v2)}"
end

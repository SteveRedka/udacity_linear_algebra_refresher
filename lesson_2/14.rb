require_relative '../lib/vector'

a = Vector.new([8.462, 7.893, -8.187])
b = Vector.new([6.984, -5.975, 4.778])

p a * b

c = Vector.new([-8.987, -9.838, 5.031])
d = Vector.new([-4.268, -1.861, -8.866])

p c.parallelogram_area(d)

e = Vector.new([1.5, 9.547, 3.691])
f = Vector.new([-6.007, 0.124, 5.772])

p e.triangle_area(f)

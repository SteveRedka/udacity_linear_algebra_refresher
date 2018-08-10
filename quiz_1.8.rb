require './lib/vector'

# Calculate dot products
p Vector.new([7.887, 4.138]).dot_product(Vector.new([-8.802, 6.776]))
p Vector.new([-5.955, -4.904, -1.874]).dot_product(Vector.new([-4.496, -8.755, 7.103]))

# Calculate radians
a = Vector.new([3.183, -7.627])
b = Vector.new([-2.668, 5.319])
p a.angle(b)

# Calculate degrees
c = Vector.new([7.35, 0.221, 5.188])
d = Vector.new([2.751, 8.259, 3.985])
p c.angle(d, true)

require_relative '../lib/vector'

a = Vector.new([3.039, 1.879])
b = Vector.new([0.825, 2.036])

p a.proj(b)

c = Vector.new([-9.88, -3.264, -8.159])
d = Vector.new([-2.155, -9.353, -9.473])

p c.height(d)

e = Vector.new([3.009, -6.172, 3.692, -2.51])
f = Vector.new([6.404, -9.144, 2.759, 8.718])

p e.height(f)
p e.proj(f)

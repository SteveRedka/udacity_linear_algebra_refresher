require_relative '../lib/vector'

a = Vector.new([-7.759, -7.88])
b = Vector.new([22.737, 23.64])
c = Vector.new([-2.029, 9.97, 4.172])
d = Vector.new([-9.231, -6.639, -7.245])
e = Vector.new([-2.328, -7.284, -1.214])
f = Vector.new([-1.821, 1.072, -2.94])
g = Vector.new([2.118, 4.827])
h = Vector.new([0, 0])

p "#{a.parallel?(b)} #{a.orthogonal?(b)}"
p "#{c.parallel?(d)} #{c.orthogonal?(d)}"
p "#{e.parallel?(f)} #{e.orthogonal?(f)}"
p "#{g.parallel?(h)} #{g.orthogonal?(h)}"

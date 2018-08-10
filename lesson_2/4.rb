require_relative '../lib/vector'
# require 'test/unit'

# p Vector.new([8.218, -9.341]) + Vector.new([-1.129, 2.111])

# class TestVector < Test::Unit::TestCase
#   def test_simple
#     vector_sum = Vector.new([8.218, -9.341]) + Vector.new([-1.129, 2.111])
#     assert_equal(Vector.new([7.089, -7.229999999999999]), vector_sum)
#   end
# end

vector_sum = Vector.new([8.218, -9.341]) + Vector.new([-1.129, 2.111])
vector_diff = Vector.new([7.119, 8.215]) - Vector.new([-8.223, 0.878])
vector_scale = Vector.new([1.671, -1.012, -0.318]).scale(7.41)

p "Vector sum: #{vector_sum}"
p "Vector diff: #{vector_diff}"
p "Vector scale: #{vector_scale}"

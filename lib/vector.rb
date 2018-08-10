# My implementation of class vector for Udacity's Linear Algebra Refresher
# course
class Vector
  attr_accessor :coordinates, :length
  def initialize(coordinates)
    @coordinates = coordinates
    @length = coordinates.length
  end

  def +(other)
    raise 'It isn`t a vector!' if other.class != self.class
    raise 'These vectors have different dimenstions' if other.length != length
    new_array = [other.coordinates, coordinates].transpose
                                                .map { |x| x.reduce(:+) }
    Vector.new(new_array)
  end

  def negative
    Vector.new(coordinates.map(&:-@))
  end

  def -(other)
    raise 'It isn`t a vector!' if other.class != self.class
    raise 'These vectors have different dimenstions' if other.length != length
    self + other.negative
  end

  def ==(other)
    raise 'It isn`t a vector!' if other.class != self.class
    raise 'These vectors have different dimenstions' if other.length != length
    coordinates == other.coordinates
  end

  def scale(int)
    Vector.new(coordinates.map! { |num| num * int })
  end

  def inspect
    @coordinates
  end

  def to_s
    "Vector: #{@coordinates}"
  end

  def mag
    # Calculate magnitude
    Math.sqrt(coordinates.map { |x| x**2 }.inject(0, &:+))
  end

  def dir
    return nil if coordinates.inject(:+).zero?
    scale(1 / mag)
  end
end

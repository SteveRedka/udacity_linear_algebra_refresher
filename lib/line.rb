require_relative './vector'

class Line
  attr_accessor :normal_vector, :constant_term, :basepoint
  def initialize(normal_vector = nil, constant_term = 0)
    @dimension = 2

    if !normal_vector
      all_zeros = [0] * @dimension
      @normal_vector = Vector.new(all_zeros)
    else
      @normal_vector = normal_vector
    end

    @constant_term = constant_term

    set_basepoint
  end

  def set_basepoint
    basepoint_coords = [0] * @dimension

    initial_index = first_nonzero_index(@normal_vector)
    if !initial_index.nil?
      initial_coefficient = @normal_vector.coordinates[initial_index]
      basepoint_coords[initial_index] = @constant_term / initial_coefficient
      @basepoint = Vector.new(basepoint_coords)
    else
      @basepoint = nil
    end
  end

  def to_s
    num_decimal_places = 3
    output = ''
    @normal_vector.coordinates.each_with_index do |num, iter|
      sign = determine_sign_for_to_s(num, iter)
      output += "#{sign}#{num.round(num_decimal_places).abs}"
    end
    output += " = #{constant_term}"
    output
  end

  def intersection(other)
    # https://www.youtube.com/watch?time_continue=448&v=AMu6GNQ4fYM
    return nil if parallel?(other)
    a, b = @normal_vector.coordinates
    c, d = other.normal_vector.coordinates
    k1 = @constant_term
    k2 = other.constant_term
    x_top = d * k1 - b * k2
    y_top = a * k2 - c * k1
    bottom = a * d - b * c
    x = x_top / bottom
    y = y_top / bottom
    [x, y]
  end

  def parallel?(other)
    normal_vector.parallel?(other.normal_vector)
  end

  def coincidental?(other)
    return false if !parallel?(other)
    connection = Vector.new([@basepoint[0] - other.basepoint[0],
                             @basepoint[1] - other.basepoint[1]])
    connection.orthogonal?(@normal_vector)
  end

  private

  def first_nonzero_index(iterable)
    iterable = iterable.coordinates if iterable.is_a? Vector
    iterable.each_with_index do |item, i|
      return i if item.abs > 1e-10
    end
    nil
  end

  def determine_sign_for_to_s(num, iter)
    if iter.zero?
      ''
    elsif num >= 0
      ' + '
    else
      ' - '
    end
  end
end

require 'line'
require 'answers/lesson3'

describe 'line' do
  context 'quiz 4' do
    a = Line.new(Vector.new([4.046, -2.836]), 1.21)
    b = Line.new(Vector.new([10.115, 7.09]), 3.025)
    c = Line.new(Vector.new([7.204, 3.182]), 8.68)
    d = Line.new(Vector.new([8.172, 4.114]), 9.883)
    e = Line.new(Vector.new([1.182, 5.562]), 6.744)
    f = Line.new(Vector.new([1.773, 8.343]), 9.525)
    vector_pairs = [[a, b], [c, d], [e, f]]

    context 'intersections' do
      it 'should detect intersections' do
        vector_pairs.zip(VECTOR_INTERSECTIONS).each do |vector_pair, answer|
          expect(vector_pair[0].intersection(vector_pair[1])).to eq answer
        end
      end
    end

    context 'parallel' do
      it 'should detect whether vectors are parallel' do
        vector_pairs.zip(VECTOR_PARALLEL).each do |vector_pair, answer|
          expect(vector_pair[0].parallel?(vector_pair[1])).to eq answer
        end
      end
    end

    context 'coincidental' do
      it 'should detect whether vectors are coincidental' do
        vector_pairs.zip(VECTOR_COINCIDENTAL).each do |vector_pair, answer|
          expect(vector_pair[0].coincidental?(vector_pair[1])).to eq answer
        end
        # Quiz doesn't give a spec which checks for actually coincidental lines
        expect(a.coincidental?(a)).to eq true
      end
    end
  end
end

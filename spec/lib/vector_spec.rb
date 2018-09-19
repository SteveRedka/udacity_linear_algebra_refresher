require 'vector'
require 'answers/lesson2'

describe 'vector' do
  it 'should recognise unequal vectors' do
    v1 = Vector.new([1, 2])
    v2 = Vector.new([1, 1])
    expect(v1).not_to eq v2
  end

  it 'should compare with delta' do
    v1 = Vector.new([1, 1.1])
    v2 = Vector.new([1, 1.09999999999999])
    expect(v1).to eq v2
  end

  context 'Quiz 4: basic operations' do
    it 'should perform addition' do
      vector_sum = Vector.new([8.218, -9.341]) + Vector.new([-1.129, 2.111])
      expect(vector_sum).to eq ADDITION
    end

    it 'should perform substraction' do
      v1 = Vector.new([7.119, 8.215])
      v2 = Vector.new([-8.223, 0.878])
      vector_diff = v1 - v2
      expect(vector_diff).to eq SUBSTRACTION
    end

    it 'should perform scalar multiplication' do
      v1 = Vector.new([1.671, -1.012, -0.318])
      multiplier = 7.41
      vector_scale = v1.scale(multiplier)
      expect(vector_scale).to eq SCALE
    end
  end

  context 'Quiz 6: magnitude and direction' do
    it 'should calculate magnitudes' do
      expect(Vector.new([-0.221, 7.437]).mag).to eq MAG1
      expect(Vector.new([8.813, -1.331, -6.247]).mag).to eq MAG2
    end
    it 'should calculate direction' do
      v1 = Vector.new([5.581, -2.136])
      expect(v1.dir).to eq DIR1
      v2 = Vector.new([1.996, 3.108, -4.554])
      expect(v2.dir).to eq DIR2
    end
  end

  context 'Quiz 8: Coding dot product and angle' do
    it 'should calculate dot products' do
      v1 = Vector.new([7.887, 4.138])
      v2 = Vector.new([-8.802, 6.776])
      expect(v1.dot_product(v2)).to eq DOT1

      v3 = Vector.new([-5.955, -4.904, -1.874])
      v4 = Vector.new([-4.496, -8.755, 7.103])
      expect(v3.dot_product(v4)).to eq DOT2
    end

    context 'angles' do
      it 'should calculate angles in radians' do
        a = Vector.new([3.183, -7.627])
        b = Vector.new([-2.668, 5.319])
        expect(a.angle(b)).to eq ANGLE_RAD
      end

      it 'should calculate angles in degrees' do
        a = Vector.new([7.35, 0.221, 5.188])
        b = Vector.new([2.751, 8.259, 3.985])
        expect(a.angle(b, true)).to eq ANGLE_DEGREES
      end
    end
  end

  context 'Quiz 10: Checking parallel, orthogonal' do
    a = Vector.new([-7.759, -7.88])
    b = Vector.new([22.737, 23.64])
    c = Vector.new([-2.029, 9.97, 4.172])
    d = Vector.new([-9.231, -6.639, -7.245])
    e = Vector.new([-2.328, -7.284, -1.214])
    f = Vector.new([-1.821, 1.072, -2.94])
    g = Vector.new([2.118, 4.827])
    h = Vector.new([0, 0])

    it 'should detect parallel vectors' do
      expect(a.parallel?(b)).to be PARALLEL1
      expect(c.parallel?(d)).to be PARALLEL2
      expect(e.parallel?(f)).to be PARALLEL3
      expect(g.parallel?(h)).to be PARALLEL4
    end

    it 'should detect orthogonal vectors' do
      expect(a.orthogonal?(b)).to be ORT1
      expect(c.orthogonal?(d)).to be ORT2
      expect(e.orthogonal?(f)).to be ORT3
      expect(g.orthogonal?(h)).to be ORT4
    end
  end

  context 'Quiz 12: coding vector projections' do
    e = Vector.new([3.009, -6.172, 3.692, -2.51])
    f = Vector.new([6.404, -9.144, 2.759, 8.718])
    it 'should project vectors on each other properly' do
      a = Vector.new([3.039, 1.879])
      b = Vector.new([0.825, 2.036])
      expect(a.proj(b)).to eq Vector.new([1.0826069624, 2.6717427583])
      answer2 = Vector.new([1.9685161, -2.810760748, 0.848084963, 2.67981323])
      expect(e.proj(f)).to eq answer2
    end

    it 'should calculate orthogonal projections properly' do
      c = Vector.new([-9.88, -3.264, -8.159])
      d = Vector.new([-2.155, -9.353, -9.473])
      expect(c.height(d)).to eq Vector.new([-8.3500810, 3.3760612, -1.43374604])
      answer2 = Vector.new [1.04048383, -3.36123925, 2.84391503, -5.1898132]
      expect(e.height(f)).to eq answer2
    end
  end

  context 'Quiz 14: cross products' do
    it 'should perform vector multiplication' do
      a = Vector.new([8.462, 7.893, -8.187])
      b = Vector.new([6.984, -5.975, 4.778])
      expect(a * b).to eq VECTOR_MULTIPLICATION
    end

    it 'should calculate parallelogram area' do
      c = Vector.new([-8.987, -9.838, 5.031])
      d = Vector.new([-4.268, -1.861, -8.866])
      expect(c.parallelogram_area(d)).to eq PARALLELOGRAM_AREA
    end

    it 'should calculate triangle area' do
      c = Vector.new([1.5, 9.547, 3.691])
      d = Vector.new([-6.007, 0.124, 5.772])
      expect(c.triangle_area(d)).to eq TRIANGLE_AREA
    end
  end
end

require 'minitest/autorun'

describe '#minimal_points' do
  it 'returns minimal points covering every segment' do
    TESTS = [
      { segments: [[2, 5], [1, 3], [3, 6]], expected: 2 }
    ]
    TESTS.each do |t|
      assert_equal t[:expected], minimal_points(t[:segments])
    end
  end
end

def minimal_points(segments)
  sorted_segments = segments.sort_by(&:last)
  points = []
  until sorted_segments.empty?
    segment = sorted_segments.shift
    point = segment.last
    points << point
    sorted_segments.each do |s|
      sorted_segments.delete(s) if point.between?(s.first, s.last)
    end
  end
  points.count
end

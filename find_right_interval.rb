require 'minitest/autorun'

def find_right_interval(intervals)
  lefts = intervals.map.with_index { |interval, i| [interval.first, i] }.sort
  intervals.map { |interval| (lefts.bsearch { |left, _i| left >= interval.last } || [-1])[-1] }
end

describe '#find_right_interval' do
  it 'outputs -1 when no intervals' do
    intervals = [[1, 2]]
    output = [-1]
    assert_equal find_right_interval(intervals), output
  end

  it 'finds right intervals' do
    intervals = [[3, 4], [2, 3], [1, 2]]
    output = [-1, 0, 1]
    assert_equal find_right_interval(intervals), output
    intervals = [[1, 4], [2, 3], [3, 4]]
    output = [-1, 2, -1]
    assert_equal find_right_interval(intervals), output
  end
end

require 'minitest/autorun'
require 'set'

def max_events(start, fin)
  visited = {}
  events = start.zip(fin)
  events.sort_by! { |el| el[-1] }
  max_events = 0
  (0...events.length).each do |k|
    event = events[k]
    start = event[0]
    fin = event[1]
    (start...fin).each do |i|
      next unless visited[i].nil?

      visited[i] = true
      max_events += 1
      break
    end
  end
  max_events
end

describe '#max_events' do
  it 'finds maximum number of non-overlapping events' do
    start = [1, 2, 3]
    fin = [2, 3, 4]
    expected = 3
    assert_equal max_events(start, fin), expected
  end
end

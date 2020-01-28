require 'minitest/autorun'

def hand_angle(h, m)
  # minute hand moves 6 degrees every minute
  mins = 6 * m
  # hour hand moves 30 degrees/hour + 0.5 degrees/minute
  hours = (30 * h) + (0.5 * m)
  degrees = (hours - mins).abs
  degrees > 180 ? 360 - degrees : degrees
end


describe 'clock hands' do
  it 'must find the correct angle' do
    TESTS = [
      { h: 1, m: 30, expected: 135 },
      { h: 3, m: 15, expected: 7.5 },
      { h: 6, m: 50, expected: 95 },
      { h: 8, m: 15, expected: 157.5 },
      { h: 11, m: 1, expected: 35.5 }
    ]
    TESTS.each do |t|
      assert_equal t[:expected], hand_angle(t[:h], t[:m])
    end
  end
end

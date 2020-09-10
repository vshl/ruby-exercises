require 'minitest/autorun'

def get_hint(secret, guess)
  secret_nums = secret.split('').map(&:to_i)
  guess_nums = guess.split('').map(&:to_i)
  digits_count1 = [0] * 10
  digits_count2 = [0] * 10

  bulls = 0
  (0...secret.length).each do |i|
    if secret_nums[i] == guess_nums[i]
      bulls += 1
    else
      digits_count1[secret_nums[i]] += 1
      digits_count2[guess_nums[i]] += 1
    end
  end
  cows = digits_count1.zip(digits_count2).map(&:min).sum
  "#{bulls}B#{cows}C"
end

describe '#get_hint' do
  it 'gives hint to the guess' do
    secret = '1807'
    guess = '7810'
    expected = '1B3C'
    assert_equal get_hint(secret, guess), expected
  end

  it 'does not match any hints' do
    secret = '1234'
    guess = '5678'
    expected = '0B0C'
    assert_equal get_hint(secret, guess), expected
  end
end

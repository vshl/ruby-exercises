require_relative 'string_changer'

describe StringChanger do

  it 'reverses strings' do
    string_changer = StringChanger.new

    reversed_string = string_changer.reverse_and_save('example string')

    expect(reversed_string).to eq 'gnirts elpmaxe'
  end

  it 'returns factorial' do
    sc = StringChanger.new
    expect(sc.factorial(5)).to eq(120)
  end

  it '1+1 = 2' do
    sc = StringChanger.new
    expect(sc.double(1)).to be(2)
    expect(sc.double(2)).to eq(4)
  end
end

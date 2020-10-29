def rotate_matrix(matrix)
  n = matrix.size
  # flip diagonally
  n.times do |i|
    (i...n).each do |j|
      matrix[i][j], matrix[j][i] = matrix[j][i], matrix[i][j]
    end
  end

  # flip horizontal
  n.times do |i|
    (n / 2).times do |j|
      matrix[i][j], matrix[i][n - j - 1] = matrix[i][n - j - 1], matrix[i][j]
    end
  end
  matrix
end

describe '#rotate_matrix' do
  let(:matrix) { [[1, 2, 3], [4, 5, 6], [7, 8, 9]] }

  it 'rotates matrix' do
    expect(rotate_matrix(matrix)).to eq [[7, 4, 1], [8, 5, 2], [9, 6, 3]]
  end
end

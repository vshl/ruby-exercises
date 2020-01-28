# frozen_string_literal: true

class SpiralMatrix
  def self.solution(n)
    spiral_matrix = Array.new(n) { Array.new(n) }
    left = 0
    right = spiral_matrix.size - 1
    top = 0
    bottom = spiral_matrix[0].size - 1
    direction = 0
    k = 1

    while left <= right && top <= bottom
      if direction.zero?
        left.upto(right) do |i|
          spiral_matrix[top][i] = k
          k += 1
        end
        top += 1
      elsif direction == 1
        top.upto(bottom) do |i|
          spiral_matrix[i][right] = k
          k += 1
        end
        right -= 1
      elsif direction == 2
        right.downto(left) do |i|
          spiral_matrix[bottom][i] = k
          k += 1
        end
        bottom -= 1
      elsif direction == 3
        bottom.downto(top) do |i|
          spiral_matrix[i][left] = k
          k += 1
        end
        left += 1
      end
      direction = (direction + 1) % 4
    end
    spiral_matrix
  end
end

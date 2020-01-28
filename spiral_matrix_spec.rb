# frozen_string_literal: true

require_relative 'spiral_matrix'

describe SpiralMatrix do
  describe '#solution' do
    it 'returns spiral matrix array' do
      expect(SpiralMatrix.solution(3)).to match_array(
        [[1, 2, 3], [8, 9, 4], [7, 6, 5]]
      )
    end
  end
end

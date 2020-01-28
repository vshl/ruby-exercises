# frozen_string_literal: true

class RingBuffer < Array
  attr_accessor :max_size

  def initialize(max_size, enum = nil)
    @max_size = max_size
    enum&.each { |e| self << e }
  end

  def <<(el)
    super if self.size < @max_size || @max_size.nil?
    self.shift
    self.push(el)
  end

  alias push <<
end

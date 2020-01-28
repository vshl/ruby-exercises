# frozen_string_literal: true

require_relative 'linked_list'

describe ListNode do
  head_node = ListNode.new(1)
  head_node.next = ListNode.new(2)
  head_node.next.next = ListNode.new(3)
  let(:root) { head_node }

  describe '#traverse' do
    it 'traverses a linked list' do
      expect(ListNode.traverse(root)).to match_array([1, 2, 3])
    end
  end

  describe '#reverse_list' do
    it 'reverses a linked list' do
      expect(ListNode.reverse_list(root)).to match_array([3, 2, 1])
    end
  end

  describe '#palindrome?' do
    it 'linked list is not palindrome' do
      expect(ListNode.palindrome?(root)).to eq false
    end
  end
end

# frozen_string_literal: true

require_relative 'linked_list'
require 'pry'

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
      expect(ListNode.reverse_list(root)).to eq [3, 2, 1]
    end
  end

  describe '#palindrome?' do
    it 'linked list is not palindrome' do
      root = ListNode.new(1)
      root.next = ListNode.new(2)
      root.next.next = ListNode.new(3)
      expect(ListNode.palindrome?(root)).to eq false
    end

    it 'linked list is a palindrome' do
      root = ListNode.new(1)
      root.next = ListNode.new(2)
      root.next.next = ListNode.new(1)
      expect(ListNode.palindrome?(root)).to eq true
    end
  end

  describe '#rotate_list' do
    it 'rotates linked list by a number' do
      head = ListNode.new(5)
      head.next = ListNode.new(2)
      head.next.next = ListNode.new(1)
      expect(ListNode.rotate_list(head, 2)).to eq [2, 1, 5]
    end
  end

  describe '#remove_dups' do
    it 'removes dupps from a linked list' do
      head = ListNode.new(1)
      head.next = ListNode.new(2)
      head.next.next = ListNode.new(2)
      head.next.next.next = ListNode.new(3)
      head.next.next.next.next = ListNode.new(3)
      expect(ListNode.remove_dups(head)).to eq [1, 2, 3]
    end
  end
end

class ListNode
  attr_accessor :val, :next

  def initialize(val)
    @val = val
    @next = nil
  end

  def self.reverse_list(head)
    return [] unless head

    prev = nil
    curr = head
    while curr
      temp = curr.next
      curr.next = prev
      prev = curr
      curr = temp
    end
    traverse(prev)
  end

  def self.traverse(head)
    result = []
    while head
      result << head.val
      head = head.next
    end
    result
  end

  def self.remove_elements(head, val)
    return nil if head.nil?

    head.next = remove_elements(head.next, val)
    head.val == val ? head.next : head
  end

  def self.palindrome?(head)
    reversed = reverse_and_clone(head)
    is_equal?(head, reversed)
  end

  def self.reverse_and_clone(node)
    head = nil
    until node.nil?
      n = ListNode.new(node.val)
      n.next = head
      head = n
      node = node.next
    end
    head
  end

  def self.is_equal?(one, two)
    until one.nil? && two.nil?
      return false unless one.val == two.val

      one = one.next
      two = two.next
    end
    one.nil? && two.nil?
  end

  def self.rotate_list(head, k)
    return head if head.nil?

    dummy = head
    n = 1
    until dummy.next.nil?
      dummy = dummy.next
      n += 1
    end
    dummy.next = head
    (n - k % n).times do
      dummy = dummy.next
    end
    prev = dummy
    dummy = prev.next
    prev.next = nil
    traverse(dummy)
  end

  def self.remove_dups(head)
    return unless head

    current = head
    until current.next.nil?
      runner = current
      until runner.next.nil?
        if runner.val == runner.next.val
          runner.next = runner.next.next
        else
          runner = runner.next
        end
      end
      current = current.next
    end
    traverse(head)
  end
end

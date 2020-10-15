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
    slow = head
    fast = head
    while fast && fast.next
      slow = slow.next
      fast = fast.next.next
    end

    prev = nil
    curr = slow
    while curr
      temp = curr.next
      curr.next = prev
      prev = curr
      curr = temp
    end

    while prev
      return false if prev.val != head.val

      head = head.next
      prev = prev.next
    end
    true
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

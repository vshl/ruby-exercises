# frozen_string_literal: true

class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end

  def self.max_depth(root)
    depth = 0
    queue = [root]
    until queue.empty?
      depth += 1
      width = queue.size
      width.times do
        node = queue.pop
        queue << node.left if node.left
        queue << node.right if node.right
      end
    end
    depth
  end

  def self.inorder_traversal(root)
    return [] unless root

    result = []
    queue = []
    curr = root
    until queue.empty? && curr.nil?
      while curr
        queue << curr
        curr = curr.left
      end
      curr = queue.pop
      result << curr.val
      curr = curr.right
    end
    result
  end

  def self.postorder_traversal(root)
    return [] unless root

    result = []
    queue = []
    curr = root

    until queue.empty? && curr.nil?
      while curr
        queue << curr
        curr = curr.left
      end
      prev = nil
      until queue.empty?
        node = queue.pop
        if node.right == prev
          result << node.val
          prev = node
        else
          queue << node
          node = node.right
          break
        end
      end
      break if queue.empty?
    end
    result
  end

  def self.level_order_traversal(root)
    return if root.nil?

    result = []
    queue = [[root, 0]]
    until queue.empty?
      node, level = queue.pop
      result[level] ||= []
      result[level] << node.val
      queue << [node.right, level + 1] unless node.right.nil?
      queue << [node.left, level + 1] unless node.left.nil?
    end
    result
  end

  def self.traversal(root)
    queue = [root]
    result = []
    until queue.empty?
      node = queue.pop
      queue << node.left unless node.left.nil?
      queue << node.right unless node.right.nil?
      result << node.val
    end
    result
  end

  def self.sorted_array_to_bst(nums)
    return if nums.nil? || nums.empty?

    mid = nums.size / 2
    n = TreeNode.new(nums[mid])
    n.left = sorted_array_to_bst(nums[0...mid])
    n.right = sorted_array_to_bst(nums[mid + 1..-1])
    n
  end

  def self.balanced?(root)
    return true unless root

    depths = []
    queue = []
    queue << [root, 0]

    until queue.empty?
      node, depth = queue.pop

      if node.left && node.right
        queue << [node.left, depth + 1] if node.left
        queue << [node.right, depth + 1] if node.right
      else
        depths << depth if depths.include?(depth)
        return false if depths.size > 2 ||
                        (depths.size == 2 && (depths[0] - depths[1]).abs > 1)
      end
    end
    true
  end

  def self.serialize(root)
    result = []
    queue = []
    queue << root
    until queue.empty?
      queue.size.times do
        node = queue.shift
        result << node.val
        queue << node.left if node.left
        queue << node.right if node.right
      end
    end
    result
  end

  def self.valid_bst?(root)
    bst_helper(root, -Float::INFINITY, Float::INFINITY)
  end

  def self.bst_helper(root, min, max)
    return true unless root

    return false if root.val <= min || root.val >= max

    bst_helper(root.left, min, root.val) && bst_helper(root.right, root.val, max)
  end
end

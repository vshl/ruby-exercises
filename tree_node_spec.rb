# frozen_string_literal: true

require_relative 'tree_node'

describe TreeNode do
  root_tree_node = TreeNode.new(3)
  tree_node_one = TreeNode.new(9)
  tree_node_two = TreeNode.new(20)
  tree_node_three = TreeNode.new(15)
  tree_node_four = TreeNode.new(7)
  tree_node_two.left = tree_node_three
  tree_node_two.right = tree_node_four
  root_tree_node.left = tree_node_one
  root_tree_node.right = tree_node_two
  let(:root) { root_tree_node }

  root_bst_node = TreeNode.new(2)
  left_bst_node = TreeNode.new(1)
  right_bst_node = TreeNode.new(3)
  root_bst_node.left = left_bst_node
  root_bst_node.right = right_bst_node
  let(:bst) { root_bst_node }

  root_invalid_bst = TreeNode.new(2)
  root_invalid_bst.left = right_bst_node
  root_invalid_bst.right = left_bst_node
  let(:invalid_bst) { root_invalid_bst }

  describe '#max_depth' do
    it 'returns max depth of tree' do
      expect(TreeNode.max_depth(root)).to eq 3
    end
  end

  describe '#inorder_traversal' do
    it 'traverses tree inorder' do
      expect(TreeNode.inorder_traversal(root)).to match_array([3, 7, 9, 15, 20])
    end
  end

  describe '#postorder_traversal' do
    it 'traverses tree postorder' do
      expect(TreeNode.inorder_traversal(root)).to match_array([3, 7, 9, 15, 20])
    end
  end

  describe '#level_order_traversal' do
    it 'traverses a tree' do
      expect(TreeNode.level_order_traversal(root)).to match_array([[3], [9, 20], [15, 7]])
    end
  end

  describe '#level_order_bottom' do
    it 'traverses a tree from the bottom' do
      expect(TreeNode.level_order_bottom(root)).to match_array([[15, 7], [9, 20], [3]])
    end
  end

  describe '#sorted_array_to_bst' do
    it 'converts array to bst' do
      nums = [-10, -3, 0, 5, 9]
      bst = TreeNode.sorted_array_to_bst(nums)
      expect(TreeNode.traversal(bst)).to match_array([-10, -3, 0, 5, 9])
    end
  end

  describe '#balanced?' do
    it 'is a balanced tree' do
      expect(TreeNode.balanced?(root)).to eq true
    end
  end

  describe '#valid_bst?' do
    it 'is a valid bst' do
      expect(TreeNode.valid_bst?(bst)).to eq true
    end
  end

  describe '#valid_bst?' do
    it 'is not a valid bst' do
      expect(TreeNode.valid_bst?(invalid_bst)).to eq false
    end
  end
end

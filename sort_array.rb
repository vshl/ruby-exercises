require 'minitest/autorun'

def sort_array(nums)
  return nums if nums.size < 2

  @nums = nums
  quick_sort(0, @nums.size - 1)
end

def quick_sort(left, right)
  return if left >= right

  index = partition(left, right)
  quick_sort(left, index - 1)
  quick_sort(index, right)

  @nums
end

def partition(l, r)
  pivot = @nums[(l + r) / 2]
  while l <= r
    l += 1 while @nums[l] < pivot
    r -= 1 while @nums[r] > pivot

    next unless l <= r

    swap(l, r)
    l += 1
    r -= 1
  end
  l
end

def swap(l, r)
  @nums[l], @nums[r] = @nums[r], @nums[l]
end

describe '#sort_array' do
  it 'sorts an array in ascending order' do
    arr = [4, 3, 1, 7, 9, 5]
    expected = [1, 3, 4, 5, 7, 9]
    assert_equal sort_array(arr), expected
    arr = [5, 2, 3, 1]
    expected = [1, 2, 3, 5]
    assert_equal sort_array(arr), expected
  end
end

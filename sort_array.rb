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

def sort_array_2(nums)
  return nums if nums.size <= 1

  mid = nums.size / 2
  left = sort_array_2(nums.slice(0...mid))
  right = sort_array_2(nums.slice(mid...nums.size))
  merge(left, right)
end

def merge(left, right)
  sorted_array = []
  while !left.empty? && !right.empty?
    sorted_array << if left.first < right.first
                      left.shift
                    else
                      right.shift
                    end
  end
  sorted_array.concat(left).concat(right)
end

describe '#sort_array' do
  it 'sorts an array in ascending order using quick sort' do
    skip
    arr = [4, 3, 1, 7, 9, 5]
    expected = [1, 3, 4, 5, 7, 9]
    assert_equal sort_array(arr), expected
    arr = [5, 2, 3, 1]
    expected = [1, 2, 3, 5]
    assert_equal sort_array(arr), expected
    arr = [2]
    expected = [2]
    assert_equal sort_array(arr), expected
  end
end

describe '#sort_array_2' do
  it 'sorts an array using merge sort' do
    assert_equal sort_array_2([2]), [2]
    assert_equal sort_array_2([]), []
    assert_equal sort_array_2([1, 3, 2]), [1, 2, 3]
    assert_equal sort_array_2([1, 5, 3, 2, 4, 6, 9, 8, 7, 0]), [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  end
end

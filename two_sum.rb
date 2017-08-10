require 'byebug'

def bad_two_sum?(arr, target)
  (0..arr.length - 2).each do |i|
    (i + 1..arr.length - 1).each do |j|
      return true if arr[i] + arr[j] == target
    end
  end

  false
end

arr = [0, 1, 5, 7]
p bad_two_sum?(arr, 6) # => should be true
p bad_two_sum?(arr, 10) # => should be false

#time complexity: O(n^2)

def okay_two_sum?(arr, target)
  sorted = arr.sort
  until sorted.count == 1
    compare = sorted.first + sorted.last
    if compare == target
      return true
    elsif compare < target
      sorted.shift
    elsif compare > target
      sorted.pop
    end
  end

  false
end

arr = [0, 1, 5, 7]
p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false

#time complexity: O(n)

def two_sum?(arr, target)
  hash = Hash.new
  arr.each do |num|
    if hash.has_key?(target - num)
      return true
    else
      hash[num] = true
    end
  end

  false
end

  arr = [0, 1, 5, 7]
  p two_sum?(arr, 6) # => should be true
  p two_sum?(arr, 10) # => should be false

  #time complexity: O(n)

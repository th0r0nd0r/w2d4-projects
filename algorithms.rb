require 'byebug'


def slow_min(array)
  #so much fluff in here
  return_el = array[0]
  array.each do |el|
    compare_array = array.dup
    compare_array.delete(el)
    compare_array.each do |el2|
      return_el = el2 if el2 < return_el
    end
  end

  return_el
end

#time complexity: O(n^2)



def faster_min(array)
  min = array[0]
  array.each do |el|
    min = el if el < min
  end

  min
end

#time complexity: O(n)



def slow_sub_sum(array)
  # byebug
  sub_arrays = []

  array.each_with_index do |num, i|
    sub_array = [num]
    sub_arrays << sub_array
    array[i + 1..-1].each do |num2|
      sub_array << num2
      sub_arrays << sub_array.dup
    end
  end

  sub_sums = sub_arrays.map do |sub_array|
    sub_array.reduce(:+)
  end

  sub_sums.flatten.max
end

list = [5, 3, -7]
p slow_sub_sum(list)

#time complexity: (n^3)

def faster_sub_sum(array)
  # byebug
  max = array.max
  return max if max < 0

  sum = array[0]
  max = sum
  array[1..-1].each do |num|
    sum += num
    if sum > max
      max = sum
    elsif sum < 0
      sum = 0
    end
  end

  max
end

list = [5, 3, -7]
p faster_sub_sum(list)

#time complexity: O(n)

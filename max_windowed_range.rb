require 'byebug'
require_relative 'minmaxstackqueue.rb'

def windowed_max_range(array, window_size)
  # byebug
  current_max_range = nil
  array.each_index do |i|
    if i + window_size > array.count
      break
    else
      window = array[i...window_size + i]
      range = window.max - window.min
      current_max_range = range if current_max_range.nil? ||
      range > current_max_range
    end
  end
  current_max_range
end

# p windowed_max_range([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8

#time complexity: O(n^2)


def max_windowed_range(array, window_size)
  byebug
  window = MinMaxStackQueue.new
  i = 0
  window_size.times do
    window.enqueue(array[i])
    i += 1
  end

  current_max_range = window.max - window.min

  (array.length - window_size).times do
    window.enqueue(array[i])
    window.dequeue
    range = window.max - window.min
    current_max_range = range if range > current_max_range
    i += 1
  end

  current_max_range
end

p max_windowed_range([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
p max_windowed_range([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
p max_windowed_range([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
p max_windowed_range([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8

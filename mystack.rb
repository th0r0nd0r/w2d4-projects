class MyStack
  attr_reader :min, :max


  #want to move max and min values when popping
  #TODO: pass in 3-element hashes to @store
  # first el is value, second two are the max and min,
  #comared with the max/min of the previous hash using peek

  
  def initialize
    @store = []
    @max = nil
    @min = nil
  end

  def pop
    @store.pop

  end

  def push(el)
    @store.push(el)
    @max = el if @max.nil? || el > @max
    @min = el if @min.nil? || el < @min
  end

  def peek
    @store.last
  end

  def size
    @store.count
  end

  def empty?
    @store.empty?
  end
end


display array
display window_size
display window
display range
display current_max_range
display i

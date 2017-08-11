require_relative 'mystack.rb'

class MinMaxStackQueue
  def initialize
    @instack = MyStack.new
    @outstack = MyStack.new
  end

  def enqueue(el)
    @instack.push(el)
  end

  def dequeue
    if @outstack.empty?
      until @instack.empty?
        @outstack.push(@instack.pop)
      end
    end
    @outstack.pop
  end

  def size
    @instack.size + @outstack.size
  end

  def empty?
    @instack.empty? && @outstack.empty?
  end

  def peek
    @instack.peek
  end

  def min
    if @instack.min.nil?
      return @outstack.min
    elsif @outstack.min.nil?
      return @instack.min
    end

    case @instack.min <=> @outstack.min
    when -1
      @instack.min
    when 0
      @instack.min
    when 1
      @outstack.min
    end
  end

  def max
    if @instack.max.nil?
      reaurn @outstack.max
    elsif @outstack.max.nil?
      return @instack.max
    end

    case @instack.max <=> @outstack.max
    when 1
      @instack.max
    when 0
      @instack.max
    when -1
      @outstack.max
    end
  end
end

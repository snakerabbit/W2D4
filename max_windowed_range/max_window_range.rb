def max_window_range(arr, w)
  window_arr = []
  current_max_range = nil
  i = 0
  while i < arr.length - w + 1
    window_arr << arr[i...i+w]
    i += 1
  end
  window_arr.each do |window|
    if current_max_range.nil? || current_max_range < window.max
      current_max_range = window.max - window.min
    end
  end

  current_max_range
end

p max_window_range([1, 0, 2, 5, 4, 8], 2)


class MyQueue
  def initialize
    @store = []
  end

  def enqueue(el)
    @store << el
  end

  def size
    @store.length
  end

  def dequeue
    @store.shift
  end

  def peek
    @store
  end

  def empty?
    @store.empty?
  end

end


class MyStack
  def initialize
    @store = []
  end

  def pop
    @store.pop
  end

  def push(el)
    @store << el
  end

  def peek
    @store.last
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end

end

class StackQueue
  def initialize
    @pop_stack = MyStack.new
    @push_stack = MyStack.new
  end

  def enqueue(el)
    @push_stack.push(el)
  end

  def dequeue
    until @push_stack.empty?
      @pop_stack.push(@push_stack.pop)
    end
    @pop_stack.pop
    until@pop_stack.empty?
      @push_stack.push(@pop_stack.pop)
    end
    @push_stack
  end

  def size
    @pop_stack.length + @push_stack.length
  end

  def empty?
    @pop_stack.empty? && @push_stack.empty?
  end
end

class MinMaxStack
  def initialize
    @store = MyStack.new
  end

  def empty?
    @store.empty?
  end

  def size
    @store.size
  end

  def min
    @store.peek[:min] unless empty?
  end

  def max
    @store.peek[:max] unless empty?
  end

  def pop
    @store
  end

  def push(val)
    @store.push({
      max: new_max(val),
      min: new_min(val),
      value: val
      })
  end

  def peek
    @store
  end

  private

  def new_max(val)
    empty? ? val : [max, val].max
  end

  def new_min(val)
    empty? ? val : [min, val].min
  end

end


class MinMaxStackQueue
  def initialize
    @pop_stack = MinMaxStack.new
    @push_stack = MinMaxStack.new
  end

  def enqueue(el)
    @push_stack.push(el)
  end

  def dequeue
    until @push_stack.empty?
      @pop_stack.push(@push_stack.pop)
    end
    @pop_stack.pop
    until@pop_stack.empty?
      @push_stack.push(@pop_stack.pop)
    end
    @push_stack
  end

  def max
    @push_stack.max
  end

  def min
    @push_stack.min
  end

  def size
    @pop_stack.length + @push_stack.length
  end

  def empty?
    @pop_stack.empty? && @push_stack.empty?
  end
end

def max_window_range_best(arr, w)
  stack = MinMaxStackQueue.new
  arr.each do |el|
    stack.enqueue(el)
  end

end

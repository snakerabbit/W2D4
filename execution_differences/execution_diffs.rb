def my_min1(arr)
  i = 0
  smallest = 0
  while i < arr.length
    i2 = i + 1
    while i2 < arr.length
      smaller = arr[i2] < arr[i] ? arr[i2] : arr[i]
      smallest = smaller  unless smallest < smaller
      i2 += 1
    end
    i += 1
  end

  smallest
end
#time complexity = n^2

def my_min2(arr)
  smallest = arr.first
  arr.each do |el|
    smallest = el if el < smallest
  end

  smallest
end
#time complexity = n

class Array
  def subsets
    return [[]] if empty?
    subs = take(count - 1).subsets
    subs.concat(subs.map { |sub| sub + [last] })
  end
end


def largest_contiguous_subsum(array)
  subs = []

  array.each_index do |idx1|
    (idx1..array.length - 1).each do |idx2|
      subs << array[idx1..idx2]
    end
  end

  subs.map { |sub| sub.inject(:+) }.max
end

  def largest_contiguous_subsum2(arr)
    largest = arr.first
    current = arr.first

    return arr.max if arr.all? { |num| num < 0 }

    arr.drop(1).each do |num|
      current = 0 if current < 0
      current += num
      largest = current if current > largest
    end

    largest
  end

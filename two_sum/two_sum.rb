def bad_two_sum?(arr, target)
  arr.each_with_index do |el1, idx1|
    (idx1+1...arr.length).each do |idx2|
      return true if el1 + arr[idx2] == target
    end
  end
  false
end


#p bad_two_sum?([0, 1, 5, 7], 120)

# O(n^2)

def okay_two_sum?(arr, target)
  arr.sort!
  el = arr.first
  until el > target || arr.empty?
    el = arr.shift || 0
    next_el = arr.first || 0
    return true if el + next_el == target
  end
  false
end

# O(nlogn)

#p okay_two_sum?([0, 1, 5, 7], 12)

def two_sum?(arr, target)
  complements = Hash.new

  arr.each do |el|
    return true if complements[target_sum - el]
    complements[el] = true
  end

  false
end

#O(n)

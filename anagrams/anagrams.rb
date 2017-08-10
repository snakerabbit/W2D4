def first_anagram? (string1, string2)
  perms = string1.chars.permutation.to_a
  perms.any? do |perm|
    perm.join == string2
  end
end

# p first_anagram?("abc", "bac")

# O(n * n!) ^^^^^^


def second_anagram?(string1, string2)
  s1char_arr = string1.chars
  s2char_arr = string2.chars
  return false if s1char_arr.length != s2char_arr.length
  s1char_arr.dup.each_with_index do |ch1, ind1|
    s2char_arr.dup.each_with_index do |ch2, ind2|
      if s1char_arr.include?(ch2)
        string1.delete!(ch2)
        string2.delete!(ch2)
        p string1
        p string2
      end
    end
  end

  string1.empty? && string2.empty?
end

#O(n^2)  ^_^
#p second_anagram?("abc", "bac")


def third_anagram?(string1, string2)
  string1.chars.sort == string2.chars.sort
end

# O(n logn) ^^
#p third_anagram?("abc", "bac")

def fourth_anagram?(string1, string2)
  s1 = Hash.new(0)
  s2 = Hash.new(0)
  string1.chars { |ch| s1[ch] += 1 }
  string2.chars { |ch| s2[ch] += 1 }
  s1.all? do |k, v|
    s2[k] == v
  end
end

# O(n)
p fourth_anagram?("abc", "bac")

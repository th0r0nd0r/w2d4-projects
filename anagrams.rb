require 'byebug'

def first_anagram?(string1, string2)
  anagrams = []
  string1.chars.permutation.each do |perm|
    anagrams << perm.join
  end

  anagrams.include?(string2)
end

p first_anagram?("gizmo", "sally")    #=> false
p first_anagram?("elvis", "lives")    #=> true

#time complexity: O(n*n!)


def second_anagram?(string1,string2)
  # byebug
  return false unless string1.length == string2.length

  chars1 = string1.chars
  chars2 = string2.chars

  chars1.each do |char|
    if chars2.include?(char)
      chars2.delete(char)
    end
  end

  return true if chars2.empty?

  false
end


p second_anagram?("gizmo", "sally")    #=> false
p second_anagram?("elvis", "lives")    #=> true

#time complexity O(n^2)


def third_anagram?(string1, string2)
  chars1 = string1.chars.sort
  chars2 = string2.chars.sort

  chars1 == chars2
end

p third_anagram?("gizmo", "sally")    #=> false
p third_anagram?("elvis", "lives")    #=> true

#time complexity: O(n)

def fourth_anagram?(string1, string2)
  chars_hash = Hash.new(0)
  string1.chars.each do |chr|
    chars_hash[chr] += 1
  end

  string2.chars.each do |chr|
    chars_hash[chr] += 1
  end

  chars_hash.values.all? {|count| count == 2}
end


p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true

#time complexity: O(n)

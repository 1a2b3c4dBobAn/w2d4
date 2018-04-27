

def first_anagram?(str1, str2)
  arr = []
  str_arr = str1.chars
  str_arr
  str_arr.permutation(str1.length) { |comb| arr << comb.join("") }
  arr.include?(str2)
end




def first_anagram_2(str1, str2)
  arr1 = str1.chars
  arr2 = str2.chars
  arr1_cp = arr1.dup
  arr2_cp = arr2.dup

  arr1.each_with_index do |letter, idx|
    arr2.each_with_index do |letter2, idx2|
      if letter2 == letter
        arr1_cp.delete_at(idx)
        arr2_cp.delete_at(idx2)
      end
    end
  end
  p arr1
  p arr2
  p arr1.empty? && arr2.empty?
end

first_anagram_2("gizmo", "sally")    #=> false
first_anagram_2("elvis", "lives") #=> true

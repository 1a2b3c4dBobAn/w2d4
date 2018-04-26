#phase 1
LIST = [0, 3, 5, 4, -5, 10, 1, 90]
LIST2 = [-5, -1, -3]
#
# O(n^2)
def my_min_1
  LIST.each_with_index do |el, i|
    smallest = true
    LIST.each_with_index do |el2, j|
      next if i == j
      smallest = false if el2 < el
    end
    return el if smallest
  end
end

# O(n)
def my_min_2
  smallest = LIST[0]
  LIST.each do |num|
    if num < smallest
      smallest = num
    end
  end
  smallest
end

#O(n^2)
def sub_sum_1
  arr = []

  LIST2.each_index do |i|
    LIST2.each_index do |j|
      next if j < i
      arr << LIST2[i..j]
    end
  end

  largest_sum = arr.first.reduce(:+)
  arr.each do |sub_arr|
    sub_sum = sub_arr.reduce(:+)
    largest_sum = sub_sum if sub_sum > largest_sum
  end
  largest_sum
  arr
end


def sub_sum_2
  sum = LIST2.first
  max = sum
  all_negative = true
  highest_negative = nil

  LIST2[1..-1].each do |el|
    if el >= 0
      all_negative = false
    end
    if el < 0
      highest_negative = el if highest_negative == nil || highest_negative < el
    end
    if sum + el < el
      sum = el
    else
      sum += el
    end
    max = sum if sum > max
  end
  all_negative ? highest_negative : max
end

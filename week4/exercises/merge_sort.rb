def merge_sort(array)
  length = array.size
  return array if length == 1
  m = (length-1) / 2
  first_array = merge_sort(array[0..m])
  second_array = merge_sort(array[m+1..length-1])
  result_array = merge(first_array, second_array)
  return result_array
end

def merge(array1, array2)
  # array1, array2 are sorted
  result = []
  while array1.size > 0 || array2.size > 0
    if array1.size == 0
      array2.each{ |i| result << i }
      array2 = []
    elsif array2.size == 0
      array1.each{ |i| result << i }
      array1 = []
    else
      if array1[0] <= array2[0]
        result << array1[0]
        array1.shift
      else
        result << array2[0]
        array2.shift
      end
    end
  end
  result
end

$/ = "END"

user_input = STDIN.gets.chomp.split("\n")
increasing_sequence = user_input.last.split(" ").map{ |s| s.to_i }
puts merge_sort(increasing_sequence).inspect
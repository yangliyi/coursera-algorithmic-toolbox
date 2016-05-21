def get_number_of_inversions(array)
  length = array.size
  return result = [array, 0] if length == 1

  m = (length-1) / 2
  first_array_result = get_number_of_inversions(array[0..m])
  second_array_result = get_number_of_inversions(array[m+1..length-1])
  result = merge(first_array_result[0], second_array_result[0])
  result[1] += (first_array_result[1] + second_array_result[1])
  return result
end

def merge(array1, array2)
  # array1, array2 are sorted
  number_of_inversions = 0
  sorted_array = []
  check_inversions_array1 = []
  check_inversions_array1 << array1
  check_inversions_array1.flatten!
  check_inversions_array2 = []
  check_inversions_array2 << array2
  check_inversions_array2.flatten!

  while check_inversions_array1.size > 0 && check_inversions_array2.size > 0
    if check_inversions_array1[0] <= check_inversions_array2[0]
      check_inversions_array1.shift
    else
      number_of_inversions += check_inversions_array1.size
      check_inversions_array2.shift
    end
  end

  while array1.size > 0 || array2.size > 0
    if array1.size == 0
      array2.each{ |i| sorted_array << i }
      array2 = []
    elsif array2.size == 0
      array1.each{ |i| sorted_array << i }
      array1 = []
    else
      if array1[0] <= array2[0]
        sorted_array << array1[0]
        array1.shift
      else
        sorted_array << array2[0]
        array2.shift
      end
    end
  end
  result = [sorted_array, number_of_inversions]
end

$/ = "END"

user_input = STDIN.gets.chomp.split("\n")
input_array = user_input.last.split(" ").map{ |s| s.to_i }
puts get_number_of_inversions(input_array)[1]
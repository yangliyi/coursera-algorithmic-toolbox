def get_majority_element(a)
  length = a.size
  more__than_half = (length / 2) + 1
  return 0 if length == 1
  result = {}
  for i in 0..length-1 do
    if result[a[i]]
      result[a[i]] += 1
    else
      result[a[i]] = 1
    end
  end

  result_values = result.values
  result = 0
  for i in 0..result_values.size-1 do
    if result_values[i] >= more__than_half
      result = 1
    end
  end
  result
end

$/ = "END"

user_input = STDIN.gets.chomp.split("\n")
input_array = user_input.last.split(" ").map{ |s| s.to_i }
puts get_majority_element(input_array)
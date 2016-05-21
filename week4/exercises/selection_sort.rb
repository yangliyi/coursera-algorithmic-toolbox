def selection_sort(array)
  length = array.size
  for i in 0..length-1 do
    min_index = i
    for j in i+1..length-1 do
      if array[j] < array[min_index]
        min_index = j
      end
    end
    array[i], array[min_index] = array[min_index], array[i]
  end
  array
end

$/ = "END"

user_input = STDIN.gets.chomp.split("\n")
increasing_sequence = user_input.last.split(" ").map{ |s| s.to_i }
puts selection_sort(increasing_sequence).inspect
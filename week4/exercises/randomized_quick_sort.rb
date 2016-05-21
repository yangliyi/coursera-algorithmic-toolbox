def randomized_quick_sort(array,l,r)
  return array if l >= r
  k = Random.new.rand(l..r)
  array[l], array[k] = array[k], array[l]
  m = partition(array, l, r)
  randomized_quick_sort(array, l, m-1)
  randomized_quick_sort(array, m+1, r)
end

def partition(array,l,r)
  x = array[l]
  last_smaller_index = l
  for i in (l+1)..r do
    if array[i] <= x
      array[i], array[last_smaller_index+1] = array[last_smaller_index+1], array[i]
      last_smaller_index += 1
    end
  end
  array[l], array[last_smaller_index] = array[last_smaller_index], array[l]
  last_smaller_index
end

$/ = "END"

user_input = STDIN.gets.chomp.split("\n")
inputs_array = user_input.last.split(" ").map{ |s| s.to_i }
length = inputs_array.size
l, r = 0, length-1
puts randomized_quick_sort(inputs_array,l,r).inspect
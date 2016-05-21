def quick_sort3(array,l,r)
  return array if l >= r

  k = median_of_first_and_middle_and_last(array, l, r)

  array[l], array[k] = array[k], array[l]
  indexes = partition3(array, l, r)
  quick_sort3(array, l, indexes[0]-1)
  quick_sort3(array, indexes[1]+1, r)
end

def partition3(array,l,r)
  x = array[l]
  m1 = l
  for i in (l+1)..r do
    if array[i] < x
      array[i], array[m1+1] = array[m1+1], array[i]
      m1 += 1
    end
  end

  m2 = m1
  for i in (m1+1)..r do
    if array[i] == x
      array[i], array[m2+1] = array[m2+1], array[i]
      m2 += 1
    end
  end

  array[l], array[m1] = array[m1], array[l]
  indexes = [m1, m2]
end

def median_of_first_and_middle_and_last(array, l, r)
  middle = (l+r)/2
  first_element = array[l]
  last_element = array[r]
  middle_element = array[middle]
  if (first_element <= middle_element && middle_element <= last_element) ||
    (last_element <= middle_element && middle_element <= first_element)
    k = middle
  elsif (first_element <= last_element && last_element <= middle_element) ||
    (middle_element <= last_element && last_element <= first_element)
    k = r
  else
    k = l
  end
  k
end

$/ = "END"

user_input = STDIN.gets.chomp.split("\n")
inputs_array = user_input.last.split(" ").map{ |s| s.to_i }
length = inputs_array.size
l, r = 0, length-1
puts quick_sort3(inputs_array,l,r).inspect
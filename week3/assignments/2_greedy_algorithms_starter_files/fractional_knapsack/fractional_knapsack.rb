def get_optimal_value(capacity, weights, values)
  return 0 if capacity == 0

  length = weights.size
  items_with_weight_and_value = []

  for i in 0..(length-1)
    value_per_unit = values[i].to_f / weights[i]
    items_with_weight_and_value << [value_per_unit, values[i], weights[i]]
  end

  sorted_items_with_weight_and_value = items_with_weight_and_value.sort{ |x,y| y[0] <=> x[0] }

  value = 0
  while capacity > 0 && sorted_items_with_weight_and_value.size > 0
    current_weight = sorted_items_with_weight_and_value[0][2]
    current_value = sorted_items_with_weight_and_value[0][1]
    if current_weight >= capacity
      value += (current_value * (capacity / current_weight ))
      capacity = 0
    elsif current_weight < capacity
      value += current_value
      capacity -= current_weight
      sorted_items_with_weight_and_value.shift
    end
  end

  value
end

$/ = "END"

user_input = STDIN.gets.chomp.split("\n")
user_input.map!{ |s| s.split(" ") }
capacity = user_input[0][1].to_i
user_input.shift
segments = user_input.each do |i|
  i.map!{|s| s.to_f }
end

values = []
weights = []
segments.each do |s|
  values << s[0]
  weights << s[1]
end

value = get_optimal_value(capacity, weights, values)
puts value

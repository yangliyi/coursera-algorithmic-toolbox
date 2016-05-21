def optimal_weight(capacity, item_weights)
  n = item_weights.size
  item_weights.unshift(0)
  values = Array.new(n+1)
  values.map!{|i|i = Array.new(capacity+1, 0)}

  for i in 1..n do
    for w in 1..capacity do
      values[i][w] = values[i-1][w]
      if item_weights[i] <= w
        val = values[i-1][w-(item_weights[i])] + item_weights[i]
        if values[i][w] < val
          values[i][w] = val
        end
      end
    end
  end

  values[n][capacity]
end

$/ = "END"

user_input = STDIN.gets.chomp.split("\n")
capacity = user_input.first.split(" ").first.to_i
item_weights = user_input.last.split(" ").map{ |s| s.to_i }

puts optimal_weight(capacity, item_weights)
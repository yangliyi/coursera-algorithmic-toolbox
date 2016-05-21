def optimal_summands(n)
  summands = []

  i = 1
  while n >= i
    if n - i > i
      summands << i
      n -= i
      i += 1
    else
      summands << n
      break
    end
  end

  return summands
end

n = gets.chomp.to_i
summands = optimal_summands(n)
puts summands.size

summands.each do |s|
  puts s
end

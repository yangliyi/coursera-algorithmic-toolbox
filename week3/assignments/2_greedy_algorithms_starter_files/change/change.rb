def get_change(n)
  return n if n < 5
  count = 0
  while n >= 10
    n -= 10
    count += 1
  end
  while n >= 5
    n -= 5
    count += 1
  end

  count += n
end

input = gets.chomp
n = input.to_i

puts get_change(n)
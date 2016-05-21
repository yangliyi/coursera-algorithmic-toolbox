def get_fibonaccihuge(n, m)
  return n if n < 2
  last_two_remainder = 0
  last_remainder = 1
  i = 2
  while true
    current_remainder = (last_remainder + last_two_remainder) % m
    if current_remainder == 1 && last_remainder == 0
      pisano_period_of_m = i - 1
      break
    else
      last_remainder, last_two_remainder = current_remainder, last_remainder
      i += 1
    end
  end

  index_of_m_in_pisano_period = n % pisano_period_of_m
  return index_of_m_in_pisano_period if index_of_m_in_pisano_period < 2

  last_two_remainder = 0
  last_remainder = 1
  for i in 2..index_of_m_in_pisano_period
    current_remainder = (last_remainder + last_two_remainder) % m
    last_remainder, last_two_remainder = current_remainder, last_remainder
  end
  current_remainder
end


inputs_arr = gets.chomp.split(" ")
n = inputs_arr[0].to_i
m = inputs_arr[1].to_i
puts get_fibonaccihuge(n, m)



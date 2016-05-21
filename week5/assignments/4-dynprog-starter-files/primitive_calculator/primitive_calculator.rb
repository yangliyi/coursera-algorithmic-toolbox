def optimal_sequence(n)
  sequence_and_number_of_operations = [{:num_of_operations=>0, 1=>0, 2=>0, 3=>0}]
  for s in 2..n do
    sequence_and_number_of_operations[s-1] = {}
    if s % 3 != 0 && s % 2 != 0
      sequence_and_number_of_operations[s-1][:num_of_operations] = sequence_and_number_of_operations[s-2][:num_of_operations] + 1
      sequence_and_number_of_operations[s-1][1] = sequence_and_number_of_operations[s-2][1] + 1
      sequence_and_number_of_operations[s-1][2] = sequence_and_number_of_operations[s-2][2]
      sequence_and_number_of_operations[s-1][3] = sequence_and_number_of_operations[s-2][3]
      next
    end

    if s % 3 == 0 && s % 2 == 0
      options_by_3 = sequence_and_number_of_operations[(s/3)-1][:num_of_operations]
      options_by_2 = sequence_and_number_of_operations[(s/2)-1][:num_of_operations]
      options_by_1 = sequence_and_number_of_operations[s-2][:num_of_operations]
      if options_by_3 <= options_by_2 && options_by_3 <= options_by_1
        sequence_and_number_of_operations[s-1][:num_of_operations] = options_by_3 + 1
        sequence_and_number_of_operations[s-1][1] = sequence_and_number_of_operations[(s/3)-1][1]
        sequence_and_number_of_operations[s-1][2] = sequence_and_number_of_operations[(s/3)-1][2]
        sequence_and_number_of_operations[s-1][3] = sequence_and_number_of_operations[(s/3)-1][3] + 1
      elsif options_by_2 <= options_by_1 && options_by_2 <= options_by_3
        sequence_and_number_of_operations[s-1][:num_of_operations] = options_by_2 + 1
        sequence_and_number_of_operations[s-1][1] = sequence_and_number_of_operations[(s/2)-1][1]
        sequence_and_number_of_operations[s-1][2] = sequence_and_number_of_operations[(s/2)-1][2] + 1
        sequence_and_number_of_operations[s-1][3] = sequence_and_number_of_operations[(s/2)-1][3]
      else
        sequence_and_number_of_operations[s-1][:num_of_operations] = options_by_1 + 1
        sequence_and_number_of_operations[s-1][1] = sequence_and_number_of_operations[s-2][1] + 1
        sequence_and_number_of_operations[s-1][2] = sequence_and_number_of_operations[s-2][2]
        sequence_and_number_of_operations[s-1][3] = sequence_and_number_of_operations[s-2][3]
      end

    elsif s % 3 == 0
      options_by_3 = sequence_and_number_of_operations[(s/3)-1][:num_of_operations]
      options_by_1 = sequence_and_number_of_operations[s-2][:num_of_operations]
      if options_by_3 <= options_by_1
        sequence_and_number_of_operations[s-1][:num_of_operations] = options_by_3 + 1
        sequence_and_number_of_operations[s-1][1] = sequence_and_number_of_operations[(s/3)-1][1]
        sequence_and_number_of_operations[s-1][2] = sequence_and_number_of_operations[(s/3)-1][2]
        sequence_and_number_of_operations[s-1][3] = sequence_and_number_of_operations[(s/3)-1][3] + 1
      else
        sequence_and_number_of_operations[s-1][:num_of_operations] = options_by_1 + 1
        sequence_and_number_of_operations[s-1][1] = sequence_and_number_of_operations[s-2][1] + 1
        sequence_and_number_of_operations[s-1][2] = sequence_and_number_of_operations[s-2][2]
        sequence_and_number_of_operations[s-1][3] = sequence_and_number_of_operations[s-2][3]
      end
    elsif s % 2 == 0
      options_by_2 = sequence_and_number_of_operations[(s/2)-1][:num_of_operations]
      options_by_1 = sequence_and_number_of_operations[s-2][:num_of_operations]
      if options_by_2 <= options_by_1
        sequence_and_number_of_operations[s-1][1] = sequence_and_number_of_operations[(s/2)-1][1]
        sequence_and_number_of_operations[s-1][2] = sequence_and_number_of_operations[(s/2)-1][2] + 1
        sequence_and_number_of_operations[s-1][3] = sequence_and_number_of_operations[(s/2)-1][3]
        sequence_and_number_of_operations[s-1][:num_of_operations] = options_by_2 + 1
      else
        sequence_and_number_of_operations[s-1][1] = sequence_and_number_of_operations[s-2][1] + 1
        sequence_and_number_of_operations[s-1][2] = sequence_and_number_of_operations[s-2][2]
        sequence_and_number_of_operations[s-1][3] = sequence_and_number_of_operations[s-2][3]
        sequence_and_number_of_operations[s-1][:num_of_operations] = options_by_1 + 1
      end
    end
  end

  return sequence_and_number_of_operations
end

user_input = gets.chomp
n = user_input.to_i
sequence = optimal_sequence(n)
puts sequence[n-1][:num_of_operations]

result = [n]

while n % 3 == 0 && sequence[n-1][3] > 0
  result.unshift(n/3)
  n /= 3
  sequence[n-1][3] -= 1
end

while n % 2 == 0 && sequence[n-1][2] > 0
  result.unshift(n/2)
  n /= 2
  sequence[n-1][2] -= 1
end

while sequence[n-1][1] > 0
  result.unshift(n-1)
  n -= 1
  sequence[n-1][1] -= 1
end

result.unshift(1) if user_input.to_i != 1
result.each{|i| print "#{i} "}

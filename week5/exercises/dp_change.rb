def dp_change(money, array_of_coins)
  return 0 if money == 0
  min_num_coins = [0]
  for m in 1..money do
    min_num_coins[m] = m
    for i in 0..(array_of_coins.size-1) do
      coin = array_of_coins[i]
      if m >= coin
        num_coins = min_num_coins[m-coin] + 1
        if num_coins < min_num_coins[m]
          min_num_coins[m] = num_coins
        end
      end
    end
  end
  return min_num_coins
end

$/ = "END"

user_input = STDIN.gets.chomp.split("\n")
money = user_input.first.to_i
array_of_coins = user_input.last.split(" ").map{ |s| s.to_i }
puts dp_change(money, array_of_coins).inspect
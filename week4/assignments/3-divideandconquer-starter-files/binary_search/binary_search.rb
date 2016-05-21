def binary_search(a, x)
  left, right = 0, a.size-1
  mid = (left + right) / 2
  while left <= right
    if mid == left
      if x == a[mid]
        result = mid
      elsif x == a[right]
        result = right
      else
        result = -1
      end
      break
    end
    if x < a[mid]
      right = mid
    elsif x > a[mid]
      left = mid
    else
      result = mid
      break
    end
    mid = (left + right) / 2
  end
  result
end

$/ = "END"

user_input = STDIN.gets.chomp.split("\n")
increasing_sequence = user_input.first.split(" ").map{ |s| s.to_i }
increasing_sequence.shift

keys = user_input.last.split(" ").map{ |s| s.to_i }
keys.shift
keys.each do |key|
  print binary_search(increasing_sequence, key).to_s + " "
end
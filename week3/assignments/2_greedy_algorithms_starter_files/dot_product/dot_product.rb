def min_dot_product(a, b)
  a.sort!{ |x,y| x <=> y }
  b.sort!{ |x,y| y <=> x }

  res = 0
  length = a.size
  for i in 0..(length-1)
    res += a[i]*b[i]
  end
  res
end

$/ = "END"

user_input = STDIN.gets.chomp.split("\n")
user_input.map!{ |s| s.split(" ") }
user_input.shift
user_input.each {|i| i.map!{|e| e.to_i} }
a = user_input.first
b = user_input.last

puts min_dot_product(a, b)
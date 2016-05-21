def optimal_points(segments)
  points = []
  segments.sort!{ |x,y| x[0] <=> y[0] }
  points << segments.first[1]

  segments.each do |s|
    if s[0] > points[-1]
      points << s[1]
    elsif s[0] < points[-1] && s[1] < points[-1]
      points.pop
      points << s[1]
    end
  end
  return points
end

$/ = "END"

user_input = STDIN.gets.chomp.split("\n")
user_input.map!{ |s| s.split(" ") }
user_input.shift
segments = user_input.each do |i|
  i.map!{|s| s.to_i }
end

points = optimal_points(segments)
puts points.size
points.each do |p|
  print p
  print " "
end


#    4   7
#     5 6
#  2  5
# 1 3
a = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]

puts "a : #{a}"
puts " "
puts "each slice"
a.each_slice(4) {|i| puts  "#{i[0]}, #{i[1]}, #{i[2]}, #{i[3]}"}  
puts " "
puts "each"
(1..16).each {|i| puts "#{a[i-4]}, #{a[i-3]}, #{a[i-2]}, #{a[i-1]}" if i % 4 == 0}
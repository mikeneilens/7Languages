array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]
[array[0..3], array[4..7], array[8..11], array[12..15]].each{|item| puts "item is #{item}"}

array.each_slice(4)  {|item| puts "item using each_slice is #{item}"}
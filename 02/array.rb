@test_array = [1, 2, 3, 4, 5, "b", "c", "d"]


puts "Access elements with []"
puts @test_array.join ","
puts "==================================================================="
puts "[0]"
puts @test_array[0]
puts "[0,2]"
puts @test_array[0, 2].join ","
puts "[0..2]"
puts @test_array[0..2].join ","
puts "[-3]"
puts @test_array[-3]
puts "[300]"
puts @test_array[300].inspect
puts

puts "Access elements with slice"
puts @test_array.join ","
puts "==================================================================="
puts ".slice(0)"
puts @test_array.slice(0)
puts "slice(0,2)"
puts @test_array.slice(0, 2).join ","
puts "slice(0..2)"
puts @test_array.slice(0..2).join ","
puts "slice(-3)"
puts @test_array.slice(-3)
puts "slice(300)"
puts @test_array.slice(300).inspect
puts

puts "Access elements with fetch"
puts @test_array.join ","
puts "==================================================================="
puts ".fetch(0)"
puts @test_array.fetch(0)
puts
puts "fetch(300) with error and exception handling "

begin
  puts @test_array.fetch(300)
rescue IndexError=>e
  puts e.message
  puts e.backtrace
  puts "Exception class : #{e.class.superclass}"
ensure
  puts "Fetch finished"
end
puts

puts "fetch(300) with error and exception handling in any block of code"
def test_fetch
  puts @test_array.fetch(300)
rescue IndexError=>e
  puts e.message
  puts e.backtrace
  puts "Exception class : #{e.class.superclass}"
ensure
  puts "Fetch finished"
end

test_fetch

puts
puts "Get array info"
puts @test_array.join ","
puts "==================================================================="
puts "Length: #{@test_array.length}"
puts "Empty?: #{@test_array.empty?}"
puts "Include?: #{@test_array.include?(1)}"
puts

puts "Iterating over Array"
puts @test_array.join ","
puts "==================================================================="

puts "Iterate with each"
@test_array.each {|item| puts "Element : #{item}"}

puts "Iterate with reverse_each"
@test_array.reverse_each {|item| puts "Element : #{item}"}

puts "Iterate with indexes"
@test_array.each_index {|item| puts "Index : #{item}"}

puts "Map operation on array"
puts (@test_array.map {|item| if item.to_s!= "b";then item;end}).join ","


puts "Select operation on array"
puts (@test_array.select {|item| item !="b"}).join ","

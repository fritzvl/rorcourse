#Ruby and RubyOnRails course examples by masterofcode.com
#Copyright (C) 2013  Masterofcode LLC


puts "Define by old syntax"
puts "==================================================================="
@test_hash={:key1=> "value1", :key2=> "value2" }
puts @test_hash.values.join ","
puts
puts "Define by new syntax"
puts "==================================================================="
@test_hash={key1: "value1", key2: "value2" }
puts @test_hash.values.join ","
puts
puts "Define from Array"
puts "==================================================================="
@test_hash=Hash["a", 1, "b", 2]
puts @test_hash.values.join ","
puts
puts "Custom key must have two mandatory methods to be implemented : eql? and hash"
puts "==================================================================="
#Example from  standard documentation of Ruby 2.0.0-p247
class Book
  attr_reader :author, :title

  def initialize(author, title)
    @author = author
    @title = title
  end

  def ==(other)
    self.class === other and
        other.author == @author and
        other.title == @title
  end

#Mandatory method to be hash key
  alias eql? ==

#Mandatory method to be hash key
  def hash
    @author.hash ^ @title.hash # XOR
  end
end

book1 = Book.new 'matz', 'Ruby in a Nutshell'
book2 = Book.new 'matz', 'Ruby in a Nutshell'

puts "Different objects"
puts "ObjectID :#{book1.object_id}"
puts "ObjectID :#{book2.object_id}"
puts
reviews = {}

reviews[book1] = 'Great reference!'
reviews[book2] = 'Nice and compact!'

puts "But the same key"
puts book1.hash
puts book2.hash
puts reviews.length

@test_hash={user1: {name: "User1 Name", email: "User1 Email"}, user2:{name: "User2 Name", email: "User2 Email"}, user3:{name: "User3 Name", email: "User3 Email"}, user4:{name: "User4 Name", email: "User4 Email"}}
puts "Enumerable methods"
puts "==================================================================="
puts (@test_hash.map {|item| "#{item[1][:name]} mapped"})
puts @test_hash.inspect
puts "==================================================================="
puts (@test_hash.map {|item| "#{item[1]['name'.to_sym]} mapped"})
puts @test_hash.inspect
puts
puts "Methods combination"
@test_array=[{name: "User1 Name", email: "User1 Email", value: 1}, {name: "User2 Name", email: "User2 Email", value: 1}, {name: "User3 Name", email: "User3 Email", value: 2}, {name: "User4 Name", email: "User4 Email", value: 0}]
puts @test_array
puts "==================================================================="
result =((((@test_array.select {|item| item[:value]<2}).each {|item| item[:value2]=item[:value]+1}).select {|item| item[:value2]==2}).map {|item| item[:name]}).first
result2 =((((@test_array.select {|item| item[:value]<2}).each {|item| item[:value2]=item[:value]+1}).select {|item| item[:value2]==2}).map {|item| item[:name]}).last
puts "((((@test_array.select {|item| item[:value]<2}).each {|item| item[:value2]=item[:value]+1}).select {|item| item[:value2]==2}).map {|item| item[:name]}).first"
puts result
puts "((((@test_array.select {|item| item[:value]<2}).each {|item| item[:value2]=item[:value]+1}).select {|item| item[:value2]==2}).map {|item| item[:name]}).last"
puts result2
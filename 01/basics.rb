# Class as value
mary = class Cow

  def moo
    puts "Moo as a cow"
  end

  self
end

puts "Class by value"
puts "==================================================================="
z= mary.new
z.moo
puts

# Class as dynamically created object
dolly = Class.new(Object) do

  def moo
    puts "Moo as an artificial cow"
  end

end

puts "Class as dynamic object"
puts "==================================================================="
x= dolly.new
x.moo
puts z.class
puts dolly.class
puts


# Create a Cow through the eigenclass(meta-class)
sally=Object.new

class << sally

  def moo
    puts "I can moo now thanks to my eigenclass!"
  end

end

puts "Object changes through the eigenclass(meta-class)"
puts "==================================================================="
sally.moo
puts sally.class


# Class eigenclass access
class << mary

  def moo
    puts "Moo as a cow class, through the class eigenclass access"
  end

end

puts "Class object changes through the eigenclass(meta-class)"
puts "==================================================================="
z.moo
mary.moo
puts


# Class-eval method
mary.class_eval do

  def moo
    puts "We can moo via class-eval"
  end

end

puts "Class changes through the class_eval"
puts "==================================================================="
z.moo
puts


# Instance-eval method
mary.instance_eval do

  def moo
    puts "Moo via instance_eval"
  end

end

puts "Class instance changes through the instance_eval"
puts "==================================================================="
mary.moo
puts


# Refinements

require("./isolator")

puts "Refinements example"
puts "==================================================================="
iso=Isolator.new
iso.isolated_cow_moo
z.moo
puts


# What must be checked right ?
puts "Object check. Am I have the right object here ?"
puts "==================================================================="
if z.class==Cow
  puts "You are very wrong!!!"
  z.moo
end
puts "=========================BUT======================================"
if z.respond_to?(:moo)
  puts "You are right! Im a Cow!"
  z.moo
end
puts

# Block, Proc, Lambda
# ===================

# Simple block
class Animal

  def say(&block)
    puts "I am #{block.class}"
    yield
  end

end


ani = Animal.new

puts "Animal says smth using block"
puts "==================================================================="
ani.say do
  puts "Simple block yield"
  z.moo
end
puts

# Block as Proc
class AnimalNext

  def initialize(&block)
    @block=block
  end

  def say
    puts "I am #{@block.class}"
    @block.call
  end

end


ani = AnimalNext.new do
  puts "Block as proc call"
  z.moo
end

puts "Animal says smth using block"
puts "==================================================================="
ani.say
puts
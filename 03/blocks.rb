#Ruby and RubyOnRails course examples by masterofcode.com
#Copyright (C) 2013  Masterofcode LLC

# Simple block example
def foo(a, b, &block)

  puts "a parameter:#{a}"
  puts "b parameter:#{b}"
  yield a, b

end

puts "Simple block example"
puts "==================================================================="

foo(1, 2) do |a, b|

  puts "a from block #{a}"
  puts "b from block #{b}"

end


# What is block?
def bar(a=5, &block)

  puts a
  yield
  puts "Block is :#{block.class}"

end

puts "What is block?"
puts "==================================================================="
bar { puts "Im a block!" }

# Lambdas
puts "Lambda passed as block"
puts "==================================================================="

a = -> { puts "Im a lambda!" }
bar &a

#Procs
puts "Proc passed as block"
puts "==================================================================="
b = Proc.new { puts "Im a Proc" }
bar &b

# Differences

puts "Proc vs lambda"
puts "==================================================================="
puts

# Return difference
puts "Return difference"
puts "==================================================================="

def baz(a=5, &block)
  puts a
  block.call
  puts "Block is :#{block.class}"
end

# Define lambda
c = -> { puts "Im a lambda with return!"; return }
baz &c

# Define proc
d = Proc.new { puts "Im a Proc"; return }

begin
  baz &d
rescue LocalJumpError => e
  puts "Error!!!"
  puts "==================================================================="
  puts e.message
  puts e.backtrace
  puts "==================================================================="
end

# Define Proc inside the method
puts "Proc defined inside the method"
puts "==================================================================="

def zoo
  d = Proc.new { puts "Im a Proc with return defined in method"; return }
  d.call
  puts "After Proc call"
end

zoo

puts
puts "Proc defined in another method"
puts "==================================================================="


def boo
  Proc.new { puts "Im a Proc with return defined in method"; return }
end

def deboo
  boo.call

rescue LocalJumpError => e
  puts "Error!!!"
  puts "==================================================================="
  puts e.message
  puts e.backtrace
  puts "==================================================================="
end

deboo

puts
# Arguments difference
puts "Arguments difference"
puts "==================================================================="

def qux(a=5, &block)
  yield a, a+1
end

# Define lambda with 2 arguments
e = ->(x, y) { puts "Sum from lambda is :#{x.to_i+y.to_i}" }

# Define proc with 2 arguments
f = Proc.new { |x, y| puts "Sum from proc is :#{x.to_i+y.to_i}" }

puts
puts "No missing arguments"
puts "==================================================================="
qux &e
qux &f

# Define proc with 3 arguments
f = Proc.new { |x, y, z| puts "Sum from proc is :#{x.to_i+y.to_i+z.to_i}" }

# Define lambda with 3 arguments
e = ->(x, y, z) { puts "Sum from lambda is :#{x.to_i+y.to_i+z.to_i}" }

puts
puts "1 missing argument"
puts "==================================================================="
qux &f
begin
  qux &e
rescue ArgumentError => e
  puts "Error!!!"
  puts "==================================================================="
  puts e.message
  puts e.backtrace
  puts "==================================================================="
end


puts
# Common use case of Procs and lambdas  - callbacks

def odd?(value, callbacks)
  puts "Is #{value} odd? "
  if value.respond_to?(:odd?) && value.odd?
    callbacks[:success].call
  else
    callbacks[:fail].call
  end

end

puts "Callbacks example"
puts "==================================================================="
odd?(5, {success: Proc.new { puts "Success!" }, fail: Proc.new { puts "Fail!" }})
odd?(6, {success: Proc.new { puts "Success!" }, fail: Proc.new { puts "Fail!" }})

puts
# Common use case of Procs and lambdas  - callbacks + factory of lambdas
puts "Callbacks example with lambdas factories"
puts "==================================================================="

def odd_callback_factory
  {success: success_callback_factory, fail: fail_callback_factory}
end

def success_callback_factory
  -> { puts "Success!" }
end

def fail_callback_factory
  -> { puts "Fail!" }
end


odd?(5, odd_callback_factory)
odd?(6, odd_callback_factory)



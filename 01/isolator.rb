#Ruby and RubyOnRails course examples by masterofcode.com
#Copyright (C) 2013  Masterofcode LLC

module CowIsolator

  refine Cow do

    def moo
      puts "OMG I AM ISOLATED"
    end

  end
end

using CowIsolator

class Isolator

  def isolated_cow_moo
    cow=Cow.new
    cow.moo
  end


end

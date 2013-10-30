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

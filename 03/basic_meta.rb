#Ruby and RubyOnRails course examples by masterofcode.com
#Copyright (C) 2013  Masterofcode LLC

module FunnyModule

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def make_funny(*attributes)

      attributes.each do |attribute|
        #Important!!! Class context for self
        if self.instance_methods.include?(attribute)

          define_method "#{attribute}_funny" do
            #Important!!! Class instance context for self
            "Hahaha!!#{self.method(attribute).call}HAHAHA!!!"
          end

        else
          raise Exception, "Attribute not found #{attribute}"
        end
      end

    end
  end


end


class MyObject
  include FunnyModule

  attr_accessor :user_name, :email, :address

  make_funny :user_name, :email, :address


  def initialize(name, email, address="someaddress")
    self.user_name=name
    self.email=email
    self.address=address
  end

end

object = MyObject.new("Bogdan", "bogdan@masterofcode.com")

puts "Funny methods list"
puts "==================================================================="
puts object.class.instance_methods.select {|item| item.to_s.include? "_funny" }
puts

puts "Funny methods calls"
puts "==================================================================="
puts object.user_name_funny
puts object.email_funny
puts object.address_funny


class ResponseFormatter

  def self.format(data)

    fall_out=100*(data.count {|item| item[:fall_out]=="yes" }).to_f/data.count.to_f
    temp=((data.collect {|item| item[:temp].to_f}).sum.to_f)/data.count.to_f

    {name:data.first[:city], temp: temp, fall_out: "#{fall_out}%"}

  end

end
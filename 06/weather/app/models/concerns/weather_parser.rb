class WeatherParser

  def self.get(data, site_name)
     {city: data, temp: Faker::Number.number(2), fall_out:["yes","no"][rand(0..1)], site_name: site_name}
  end

end
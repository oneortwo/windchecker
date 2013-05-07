require 'weather'

describe Weather, "#data" do
  it "contains temperature, wind speed and symbol" do
    w = Weather.new(13, 5, 2)
    w.temperature.should eq(13)
    w.wind_speed.should eq(5)
    w.symbol.should eq(2)
  end

  it "is warm if temperature is 15 or above" do
    w = Weather.new

    w.temperature = 15
    w.is_warm.should eq(true)

    w.temperature = 14
    w.is_warm.should eq(false)
  end

  it "is windy if wind_speed is 3 or above" do
    w = Weather.new

    w.wind_speed = 3
    w.is_windy.should eq(true)

    w.wind_speed = 2
    w.is_windy.should eq(false)
  end

  it "is sunny if the symbol is 1-3" do
    w = Weather.new
    w.symbol = 1
    w.is_sunny.should eq true
    
    w.symbol = 2
    w.is_sunny.should eq true
    
    w.symbol = 3
    w.is_sunny.should eq true

    w.symbol = 0
    w.is_sunny.should eq false

    w.symbol = 4
    w.is_sunny.should eq false
  end

end
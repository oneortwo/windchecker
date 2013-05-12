class Weather
  attr_accessor :temperature, :wind_speed, :symbol, :symbol_text, :date

  def initialize (temperature = 0, wind_speed = 0, symbol = 0)
    @temperature = temperature
    @wind_speed = wind_speed
    @symbol = symbol
  end

  def is_warm
    temperature >= 15
  end

  def is_windy
    wind_speed >= 3
  end

  def is_sunny
    symbol >= 1 and symbol <= 3
  end
end

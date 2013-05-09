require_relative 'weather'

class Populator
  def populate(fc)
    sanity_check(fc)
    temp = fc['temperature'][0]['value'].to_i
    wind = fc['windSpeed'][0]['mps'].to_i
    sunny = fc['symbol'][0]['number'].to_i

    Weather.new(temp, wind, sunny)
  end

  def sanity_check(fc)
    if fc['period'].to_i != 2
      raise "period is not day"
    end
  end
end
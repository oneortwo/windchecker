require_relative 'weather'
require 'date'

class Populator
  def populate(fc)
    sanity_check(fc)
    temp = fc['temperature'][0]['value'].to_i
    wind = fc['windSpeed'][0]['mps'].to_i
    sunny = fc['symbol'][0]['number'].to_i

    w = Weather.new(temp, wind, sunny)
    w.symbol_text = fc['symbol'][0]['name']
    w.date = get_date(fc)

    return w
  end

  def get_date(fc)
    raw = fc['from']
    regex = /\d{4}\-\d{2}\-\d{2}/
    date = raw[regex]
    return Date.parse(date)
  end

  def sanity_check(fc)
    if fc['period'].to_i != 2
      raise "period is not day"
    end
  end
end

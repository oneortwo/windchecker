require 'xmlsimple'

class XmlReader 

  def read(xml)
    hash = convert_to_hash(xml)
    forecasts = get_forecasts(hash)
    find_first_day_forecast(forecasts)
  end

  def find_first_day_forecast(fcs)
    fcs.each do |fc|
      if fc['period'].to_i == 2
        return fc
      end
    end
  end

  def get_forecasts(hash)
    hash['forecast'][0]['tabular'][0]['time']
  end
  
  def convert_to_hash(xml)
    XmlSimple.xml_in(xml)
  end

end
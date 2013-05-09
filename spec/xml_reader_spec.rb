require 'xml_reader'

describe XmlReader do

  it "does not return nil" do
    reader = XmlReader.new
    reader.read('forecast.xml').should_not be_nil
  end

  it "does should return day" do
    reader = XmlReader.new
    h = reader.read('forecast.xml')
    h['period'].should eq('2')
  end

  it "does should contain felds for wind, temp and sunnyness" do
    reader = XmlReader.new
    h = reader.read('forecast.xml')
    puts h['windSpeed'][0]['mps']
    puts h['temperature'][0]['value']
    puts h['symbol'][0]['number']
  end
end
require 'xml_reader'

$mock = "<?xml version=\"1.0\" encoding=\"utf-8\"?><weatherdata><forecast><tabular><time from=\"2013-05-11T17:00:00\" to=\"2013-05-11T18:00:00\" period=\"2\"><!-- Valid from 2013-05-11T17:00:00 to 2013-05-11T18:00:00 --><symbol number=\"2\" name=\"Fair\" var=\"02d\" /><precipitation value=\"0\" /><!-- Valid at 2013-05-11T17:00:00 --><windDirection deg=\"264.2\" code=\"W\" name=\"West\" /><windSpeed mps=\"4.6\" name=\"Gentle breeze\" /><temperature unit=\"celsius\" value=\"17\" /><pressure unit=\"hPa\" value=\"1008.5\" /></time></tabular></forecast></weatherdata>"

describe XmlReader do

  it "does not return nil" do
    reader = XmlReader.new
    reader.read($mock).should_not be_nil
  end

  it "does should return day" do
    reader = XmlReader.new
    h = reader.read($mock)
    h['period'].should eq('2')
  end

  it "does should contain felds for wind, temp and sunnyness" do
    reader = XmlReader.new
    h = reader.read($mock)
    puts h['windSpeed'][0]['mps']
    puts h['temperature'][0]['value']
    puts h['symbol'][0]['number']
  end
end

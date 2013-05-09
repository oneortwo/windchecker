require 'xml_reader'

describe XmlReader do

  it "does not return nil" do
    reader = XmlReader.new
    reader.read('forecast.xml').should_not be_nil
  end
end
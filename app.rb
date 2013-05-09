require 'sinatra'
require 'haml'
require_relative 'lib/weather'
require_relative 'lib/xml_reader'
require_relative 'lib/populator'
require_relative 'lib/classifier'

get '/' do
  reader = XmlReader.new
  p = Populator.new
  c = Classifier.new
  # replace with http get
  xml = reader.read('forecast.xml')
  weather = p.populate(xml)
  @desc = c.apply(weather)
  haml :index 
end  
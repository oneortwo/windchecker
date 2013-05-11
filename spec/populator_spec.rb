require 'populator'
$mock_weather_data = {'period' => '2',
                      'windSpeed'=>[{'mps'=>'23'}],
                      'temperature'=>[{'value'=>'2'}],
                      'symbol'=>[{'number'=>'1', 'name' => 'great clouds'}]
                      }

describe Populator do

  it "raises exception if not day" do
    p = Populator.new
    w = {'period' => '3'}
    expect {p.populate(w)}.to raise_error
  end

  it "returns integers for numerical values" do
    p = Populator.new
    weather = p.populate($mock_weather_data)
    weather.temperature.class.should eq(Fixnum)
    weather.wind_speed.class.should eq(Fixnum)
    weather.symbol.class.should eq(Fixnum)
  end

  it "gets it all right" do
    p = Populator.new
    weather = p.populate($mock_weather_data)
    weather.is_sunny.should eq(true)
    weather.is_windy.should eq(true)
    weather.is_warm.should eq(false)
  end

  it "populates with symbol text" do
    p = Populator.new
    weather = p.populate($mock_weather_data)
    weather.symbol_text.should eq('great clouds')
  end

end

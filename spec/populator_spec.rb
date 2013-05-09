require 'populator'

describe Populator do

  it "raises exception if not day" do
    p = Populator.new
    w = {'period' => '3'}
    expect {p.populate(w)}.to raise_error
  end

  it "gets returns integers" do
    p = Populator.new
    w = {'period' => '2', 
      'windSpeed'=>[{'mps'=>'23'}],
      'temperature'=>[{'value'=>'2'}],
      'symbol'=>[{'number'=>'1'}]
    }    
    weather = p.populate(w)
    weather.temperature.class.should eq(Fixnum)
    weather.wind_speed.class.should eq(Fixnum)
    weather.symbol.class.should eq(Fixnum)
  end

  it "gets it all right" do
    p = Populator.new
    w = {'period' => '2', 
      'windSpeed'=>[{'mps'=>23}],
      'temperature'=>[{'value'=>2}],
      'symbol'=>[{'number'=>1}]
    }    
    weather = p.populate(w)
    weather.is_sunny.should eq(true)
    weather.is_windy.should eq(true)
    weather.is_warm.should eq(false)
  end

end
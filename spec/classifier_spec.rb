require 'classifier'
require 'weather'

describe Classifier, "#apply" do

  it "returns cold-drizzle when f f f" do
    c = Classifier.new
    w = double("Weather")
    w.stub(:is_warm) { false }
    w.stub(:is_sunny) { false }
    w.stub(:is_windy) { false }
    c.apply(w)['short'].should eq("cold-drizzle")
  end

  it "returns storm when f f t" do
    c = Classifier.new
    w = double("Weather")
    w.stub(:is_warm) { false }
    w.stub(:is_sunny) { false }
    w.stub(:is_windy) { true }
    c.apply(w)['short'].should eq("storm")
  end

  it "returns winter-wonderland when f t f" do
    c = Classifier.new
    w = double("Weather")
    w.stub(:is_warm) { false }
    w.stub(:is_sunny) { true }
    w.stub(:is_windy) { false }
    c.apply(w)['short'].should eq("winter-wonderland")
  end

  it "returns winter-sailing when f t t" do
    c = Classifier.new
    w = double("Weather")
    w.stub(:is_warm) { false }
    w.stub(:is_sunny) { true }
    w.stub(:is_windy) { true }
    c.apply(w)['short'].should eq("winter-sailing")
  end

  it "returns muggy when t f f" do
    c = Classifier.new
    w = double("Weather")
    w.stub(:is_warm) { true }
    w.stub(:is_sunny) { false }
    w.stub(:is_windy) { false }
    c.apply(w)['short'].should eq("muggy")
  end

  it "returns hardcore-sailing when t f t" do
    c = Classifier.new
    w = double("Weather")
    w.stub(:is_warm) { true }
    w.stub(:is_sunny) { false }
    w.stub(:is_windy) { true }
    c.apply(w)['short'].should eq("hardcore-sailing")
  end

  it "returns laid-back when t t f" do
    c = Classifier.new
    w = double("Weather")
    w.stub(:is_warm) { true }
    w.stub(:is_sunny) { true }
    w.stub(:is_windy) { false }
    c.apply(w)['short'].should eq("laid-back")
  end

  it "returns perfect when t t t" do
    c = Classifier.new
    w = double("Weather")
    w.stub(:is_warm) { true }
    w.stub(:is_sunny) { true }
    w.stub(:is_windy) { true }
    c.apply(w)['short'].should eq("perfect")
  end
end

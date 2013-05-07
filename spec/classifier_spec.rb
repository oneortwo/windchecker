require 'classifier'
require 'weather'

describe Classifier, "#apply" do
  it "returns cold-drizzle when f f f" do
    c = Classifier.new
    w = Weather.new(0, 0, 5)
    c.apply(w).should eq("cold-drizzle")
  end

  it "returns cold-drizzle when f f f" do
    c = Classifier.new
    w = Weather.new(0, 0, 5)
    c.apply(w).should eq("cold-drizzle")
  end
end
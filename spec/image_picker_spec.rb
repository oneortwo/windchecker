require "image_picker"

describe ImagePicker do

  it "raises error if file path does not exist" do
    sut = ImagePicker.new
    expect {sut.pick('bowling')}.to raise_error
  end

  it "should open existing folder" do
    sut = ImagePicker.new
    expect {sut.pick('spec/data/img/single')}.to_not raise_error
  end

  it "raises error if dir empty" do
    sut = ImagePicker.new
    expect {sut.pick('spec/data/img/empty')}.to raise_error
  end

  it "returns only image in single dir" do
    sut = ImagePicker.new
    sut.pick('spec/data/img/single').should eq('rainy.jpg')
  end

  it "finds one image in single dir" do
    sut = ImagePicker.new
    sut.get_images('spec/data/img/single').length.should eq(1)
  end

  it "finds two images in multi dir" do
    sut = ImagePicker.new
    sut.get_images('spec/data/img/multi').length.should eq(2)
  end

  it "picks one of the two images" do
    sut = ImagePicker.new
    img = sut.pick('spec/data/img/multi')
    wanted = 'rainy.jpg,rainy2.jpg'
    puts img
    wanted.include?(img).should eq(true)
  end
end

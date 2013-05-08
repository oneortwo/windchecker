class Classifier

  def initialize
    @classifications = {}
    @classifications[ warm:false, sunny:false, windy:false ] = "cold-drizzle"
    @classifications[ warm:false, sunny:false,  windy:true ] = "storm"
    @classifications[ warm:false, sunny:true,  windy:false ] = "winter-wonderland"
    @classifications[ warm:false, sunny:true,  windy:true ] = "winter-sailing"
    @classifications[ warm:true, sunny:false,  windy:false ] = "muggy"
    @classifications[ warm:true, sunny:false,  windy:true ] = "hardcore-sailing"
    @classifications[ warm:true, sunny:true,  windy:false ] = "laid-back"
    @classifications[ warm:true, sunny:true,  windy:true ] = "perfect"
  end

  def apply(weather)
    @classifications[ warm:weather.is_warm, 
                      sunny:weather.is_sunny, 
                      windy:weather.is_windy ]
  end

end

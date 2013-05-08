class Classifier

  def initialize
    @c = {}
    @c[ warm:false, sunny:false, windy:false ] = "cold-drizzle"
    @c[ warm:false, sunny:false,  windy:true ] = "storm"
    @c[ warm:false, sunny:true,  windy:false ] = "winter-wonderland"
    @c[ warm:false, sunny:true,  windy:true ] = "winter-sailing"
    @c[ warm:true, sunny:false,  windy:false ] = "muggy"
    @c[ warm:true, sunny:false,  windy:true ] = "hardcore-sailing"
    @c[ warm:true, sunny:true,  windy:false ] = "laid-back"
    @c[ warm:true, sunny:true,  windy:true ] = "perfect"
  end

  def apply(weather)
    @c[ warm:weather.is_warm, sunny:weather.is_sunny, windy:weather.is_windy ]
  end

end

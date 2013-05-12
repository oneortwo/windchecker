class Classifier

  def initialize
    @c = {}
    @c[ warm:false, sunny:false, windy:false ] = {"short" => "cold-drizzle", "long" => "If I where you, Id stay in..."}
    @c[ warm:false, sunny:false,  windy:true ] = {"short" => "storm", "long" => "It, will be windy allright, but thats about it"}
    @c[ warm:false, sunny:true,  windy:false ] = {"short" => "winter-wonderland", "long" => "It will be cold and not very windy"}
    @c[ warm:false, sunny:true,  windy:true ] = {"short" => "winter-sailing", "long" => "If you dont mind a bit of chilliness, its gonna be pretty nice"}
    @c[ warm:true, sunny:false,  windy:false ] = {"short" => "muggy", "long" => "Its gonna be sort of warm, but not very windy"}
    @c[ warm:true, sunny:false,  windy:true ] = {"short" => "hardcore-sailing", "long" => "Not much sun, but otherwise pretty good"}
    @c[ warm:true, sunny:true,  windy:false ] = {"short" => "laid-back", "long" => "Great weather for anything but sailing"}
    @c[ warm:true, sunny:true,  windy:true ] = {"short" => "perfect", "long" => "Pretty much perfect..."}
  end

  def apply(weather)
    @c[ warm:weather.is_warm, sunny:weather.is_sunny, windy:weather.is_windy ]
  end

end

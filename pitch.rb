
class Pitch

  PITCHES = ["Curveball", "Slider", "Fastball"]
  LOCATIONS = ["Outside", "Inside", "Over the plate"]

  def initialize
    @location = LOCATIONS.sample
    @type = PITCHES.sample
  end

  def description
    "#{@type} #{@location}"
  end

  def over_the_plate?
    @location == "Over the plate"
  end
end

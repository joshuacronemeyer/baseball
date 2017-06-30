
class Player
  PLAYER_FIRST_NAMES = ["Jacks", "Jay", "Simon", "Willie", "Gaga", "Sonnie", "Alice", "Izzy", "Sofia", "Rafael", "Kate", "Sticky", "Loopy", "Biffy"]
  PLAYER_LAST_NAMES = ["Brown", "Smith", "Cronemeyer", "Hippert", "Johns", "Lennon", "McCartney", "Curry", "Gonzalez"]

  def initialize(position)
    @name = random_name
    @position = position
  end

  def announce
    puts "#{@position}: #{@name}"
  end

  def pitch
    pitch = Pitch.new
    puts "#{@name} throws a #{pitch.description}!"
    pitch
  end

  def bat
    swing = Swing.new
    if swing.swing?
      puts "#{@name} swings!"
    else
      puts "#{@name} watches it go past."
    end
    swing
  end

  def pitcher?
    @position == "P"
  end

  private
  def random_name
    "#{PLAYER_FIRST_NAMES.sample} #{PLAYER_LAST_NAMES.sample}"
  end
end



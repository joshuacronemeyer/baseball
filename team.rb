
class Team
  POSITIONS = ["1B", "2B", "3B", "C", "RF", "LF", "CF", "P", "SS"]

  attr_accessor :name
  def initialize(name)
    @name = name
    @players = POSITIONS.map{|p| Player.new(p)}
    @at_bat = @players.first
  end

  def announce
    puts "Team #{@name}"
    @players.each{|p| p.announce}
  end

  def batter
    @at_bat
  end

  def next_batter
    current_batter_index = @players.index(@at_bat)
    next_batter_index = ((current_batter_index+=1) % @players.count)
    @at_bat = @players[next_batter_index]
  end

  def pitcher
    @players.find{|p| p.pitcher?}
  end
end

class Baseball
  attr_reader :home, :visitor, :outs
  def initialize(home_team, away_team)
    @home = home_team
    @visitor = away_team
    @outs = 0
    @umpire = Umpire.new(self)
  end

  def start
    @umpire.play_ball
  end

  def out!
    @outs += 1
  end
end


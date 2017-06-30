class Baseball

  attr_reader :home, :visitor, :outs
  def initialize(home_team, away_team)
    @home = home_team
    @visitor = away_team
    @outs = 0
    @umpire = Umpire.new(self)
    @inning_position = :top
  end

  def start
    @umpire.play_ball
  end

  def out!
    @outs += 1
  end

  def change_sides!
    if @inning_position == :top
      @inning_position = :bottom
    else
      @inning_position = :top
    end
    @outs = 0
  end

  def offense
    if @inning_position == :top
      return @visitor
    else
      return @home
    end
  end

  def defense
    if @inning_position == :top
      return @home
    else
      return @visitor
    end
  end

end


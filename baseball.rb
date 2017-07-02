class Baseball

  attr_reader :outs
  def initialize(home_team, away_team)
    @home = home_team
    @visitor = away_team
    @outs = 0
    @umpire = Umpire.new(self)
    @bases = Bases.new(self)
    @inning_position = :top
    @inning = 0
    @home_score = 0
    @visitor_score = 0
  end

  def start
    next_inning
    @umpire.play_ball
  end

  def next_inning
    @inning += 1
  end

  def complete?
    @inning > 9
  end

  def winner
    if @home_score > @visitor_score
      @home
    else
      @visitor
    end
  end

  def out!
    @outs += 1
  end

  def advance_runners(player)
    @bases.advance_runners(player)
    puts @bases
  end

  def score_run!
    if @home == offense
      @home_score += 1
    else
      @visitor_score += 1
    end
    puts "The score is #{the_score}"
  end

  def the_score
    "#{@home.name} #{@home_score}, #{@visitor.name} #{@visitor_score}"
  end

  def change_sides!
    if @inning_position == :top
      @inning_position = :bottom
    else
      @inning_position = :top
    end
    @outs = 0
    @bases.change_sides!
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


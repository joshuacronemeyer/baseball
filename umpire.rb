
class Umpire
  def initialize(game)
    @game = game
    @count = Count.new
  end

  def play_ball
    until @game.complete?
      run_inning
      @game.next_inning
    end

    puts "The game is over with the score #{@game.the_score}. The #{@game.winner} win!"
  end

  def run_inning
    puts "Welcome to the top of the #{@inning} inning"
    puts "#{@game.offense.name} will be batting"
    until side_change?
      next_at_bat
    end
    @game.change_sides!
    puts "It's the bottom of the #{@inning} inning"
    puts "#{@game.offense.name} will be batting"
    until side_change?
      next_at_bat
    end
  end

  private

  def side_change?
    @game.outs == 3
  end

  def next_at_bat
    @count = Count.new
    while @count.not_over?
      ruling = Ruling.new(@game.defense.pitcher.pitch, @game.offense.batter.bat)
      @count.strike! if ruling.strike?
      @count.ball! if ruling.ball?
      break if ruling.hit?
    end
    out! if @count.out?
    walk! if @count.walk?
    hit! if ruling.hit?
    @game.offense.next_batter
  end

  def out!
    @game.out!
    puts "You're outta there!"
  end

  def walk!
    puts "Walk"
    @game.advance_runners(@game.offense.batter)
  end

  def hit!
    puts "Hit!"
    @game.advance_runners(@game.offense.batter)
  end

  class Ruling
    def initialize(pitch, swing)
      @swing = swing
      @pitch = pitch
    end

    def ball?
      ball = !@swing.swing? && !@pitch.over_the_plate?
      puts "Ball!" if ball
      ball
    end

    def strike?
      strike = (@swing.swing? && !@pitch.over_the_plate?) || (!@swing.swing? && @pitch.over_the_plate?)
      puts "Strike!" if strike
      strike
    end

    def hit?
      @swing.swing? && @pitch.over_the_plate?
    end
  end

  class Count
    def initialize
      @balls = 0
      @strikes = 0
    end

    def out?
      @strikes == 3
    end

    def walk?
      @balls == 4
    end

    def ball!
      @balls +=1
    end

    def strike!
      @strikes += 1
    end

    def over?
      out? || walk?
    end

    def not_over?
      !over?
    end
  end
end


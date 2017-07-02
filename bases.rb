class Bases
  def initialize(game)
    @nobody = Player.new("Ghost runner", "Nobody")
    @first = @nobody
    @second = @nobody
    @third = @nobody
    @game = game
  end

  def advance_runners(player)
    score(@third)
    @third = @second
    @second = @first
    @first = player
  end

  def to_s
    "#{@first} is on first. #{@second} is on second. #{@third} is on third."
  end

  def change_sides!
    @first = @nobody
    @second = @nobody
    @third = @nobody
  end

  private

  def score(runner)
    return if @third == @nobody
    puts "#{runner} scores!"
    @game.score_run!
  end
end

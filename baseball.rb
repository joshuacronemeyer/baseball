require_relative 'player'
require_relative 'team'
require_relative 'umpire'

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

def draw_diamond
  diamond = <<-EOF
          @
        /   \\
      /       \\
    /           \\
  @       _       @
    \\           /
      \\       /
        \\   /
          #
EOF
  puts diamond
end

def setup_teams
  puts "Please enter name for player1 team"
  team_1_name = gets
  @team1 = Team.new(team_1_name)
  puts "Please enter name for player2 team"
  team_2_name = gets
  @team2 = Team.new(team_2_name)
end

setup_teams
@game = Baseball.new(@team1, @team2)
@team1.announce
@team2.announce
draw_diamond
@game.start


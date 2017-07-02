require_relative 'swing'
require_relative 'pitch'
require_relative 'player'
require_relative 'team'
require_relative 'umpire'
require_relative 'bases'
require_relative 'baseball'

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


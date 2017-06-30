
require_relative '../umpire'
require_relative '../baseball'
require_relative '../team'
require_relative '../player'

describe Baseball do
  let(:home) { Team.new("Giants") }
  let(:away) { Team.new("Nationals") }

  describe "#offense" do
    it "should have visitor batting in top of the inning" do
      game = Baseball.new(home, away)
      expect(game.offense).to eq(away)
    end

    it "should have home batting in bottom of the inning" do
      game = Baseball.new(home, away)
      game.change_sides!
      expect(game.offense).to eq(home)
    end
  end

  describe "#defense" do
    it "should have home defending in top of the inning" do
      game = Baseball.new(home, away)
      expect(game.defense).to eq(home)
    end

    it "should have visitor defending in bottom of the inning" do
      game = Baseball.new(home, away)
      game.change_sides!
      expect(game.defense).to eq(away)
    end
  end

end

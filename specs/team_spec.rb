
require_relative '../player'
require_relative '../team'
describe Team do
  describe "#next_batter" do
    it "should allow you to bat through the order" do
      team1 = Team.new("Giants")
      first_batter = team1.batter
      9.times { team1.next_batter }
      expect(team1.batter).to eq(first_batter)
    end
  end
end


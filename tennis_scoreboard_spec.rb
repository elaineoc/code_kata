require "./tennis_scoreboard.rb"
require "./player.rb"

describe TennisScoreboard do
  subject{TennisScoreboard.new(Player.new, Player.new)}

  it {should respond_to(:player_one)}
  it {should respond_to(:player_two)}

  describe "each player should begin at love" do
    specify { subject.game_score.should == "love:love" }
  end

  describe "a player wins a point" do
    let(:player_one){Player.new}
    let(:player_two){Player.new}
	let(:one_game_index){0}
	let(:two_game_index){0}
	let(:scoreboard){TennisScoreboard.new(player_one, player_two)}
	
	subject do
	  player_one.game_index = one_game_index
	  player_two.game_index = two_game_index
	  scoreboard.play_point(player_one, player_two)
      scoreboard.game_score
	end
  
    it {should == "15:love"}

    context "players were at deuce" do
	  let(:one_game_index) {3}
	  let(:two_game_index) {3}
	  it {should == "ADV:40"} 
	end
	
    context "winner was at ADV" do
	  let(:one_game_index) {4}
	  let(:two_game_index) {3}
	  it {should == "W:L"} 
	end 
	
    context "loser was below 40" do
	  let(:one_game_index) {3}
	  let(:two_game_index) {1}
	  it {should == "W:L"} 
	end
	
    context "loser was at ADV" do
	  let(:one_game_index) {3}
	  let(:two_game_index) {4}
	  it {should == "40:40"} 
	end
  end
end

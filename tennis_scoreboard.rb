class TennisScoreboard
  attr_accessor :player_one, :player_two

  POSSIBLE_SCORES = [ "love", "15", "30", "40", "ADV", "W", "L"]
  MIN_GAME_WIN, WON, LOSS = 3, 5, 6

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
  end

  def game_score
    [POSSIBLE_SCORES[player_one.game_index], POSSIBLE_SCORES[player_two.game_index]].join(":")
  end

  def play_point(winner, loser)
    winner.game_index += 1 and return if winner.game_index < MIN_GAME_WIN
    winner.game_index, loser.game_index = if winner.game_index - loser.game_index >= 1
	  [WON, LOSS]
	else
	  loser.game_index - winner.game_index >= 1 ? [3,3] : [4, 3]
	end
  end
end

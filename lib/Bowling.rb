# Given a valid sequence of rolls for one line of American Ten-Pin Bowling,
# calculates the total score for the game.
#
# @author Menglin "Mark" Xu
# @see http://codingdojo.org/kata/Bowling/ Bowling Kata.
#
# @example A perfect game:
#   bowling = Bowling.new
#   12.times { bowling.roll(10) }
#   bowling.score # 300
class Bowling
  # Number of pins struck from each roll.
  # @return [Array<Numeric>] The pins struck from each roll.
  attr_reader :scores

  def initialize
    @scores = []
  end

  # Appends number of pins struck to scores.
  # @param pins [Numeric] The number of pins struck.
  # @return (see .scores)
  def roll(pins)
    @scores.push(pins)
  end

  # Calculates the total score for the game.
  # @return [Numeric] The total score.
  def score()
    total_score = 0
    number_of_rolls = @scores.count

    @scores.each_with_index do |current_score, index|
      last_score = @scores[index - 1]
      last_last_score = @scores[index - 2]
      is_last_roll = number_of_rolls - 1 == index
      is_gutter_ball = last_last_score == 0

      # check if there are at least 2 rolls
      if index > 1
        is_strike = last_last_score == 10
        is_spare = last_score + last_last_score == 10 && !is_gutter_ball
      end

      if !is_last_roll
        # add bonus scores if strike
        if is_strike
          total_score += current_score + last_score
        # add bonus score if spare
        elsif is_spare
          total_score += current_score
        end
      end

      # always add current score
      total_score += current_score
    end

    total_score
  end
end

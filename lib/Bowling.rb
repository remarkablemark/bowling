class Bowling
  attr_reader :scores

  def initialize
    @scores = []
  end

  def roll(pins)
    @scores.push(pins)
  end

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

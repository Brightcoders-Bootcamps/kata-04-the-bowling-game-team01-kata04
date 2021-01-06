# frozen_string_literal: true

class Frame
  attr_accessor :ball_1, :ball_2, :total_frame

  def initialize(ball_1, ball_2)
    @ball_1 = ball_1
    @ball_2 = ball_2
    @total_frame = @ball_1 + @ball_2
    if @ball_1 == 10
      @strike = true
    elsif @total_frame == 10
      @spare = true
    end
  end

  def is_strike?
    @strike
  end

  def is_spare?
    @spare
  end
end

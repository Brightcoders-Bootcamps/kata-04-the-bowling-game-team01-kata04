# frozen_string_literal: true

# Clase dedicada el tablero de juego
class Frame
  attr_accessor :ball1, :ball2, :total_frame

  def initialize(ball1, ball2)
    @ball1 = ball1
    @ball2 = ball2
    @total_frame = @ball1 + @ball2
    if @ball1 == 10
      @strike = true
    elsif @total_frame == 10
      @spare = true
    end
  end

  def strikes?
    @strike
  end

  def spares?
    @spare
  end
end

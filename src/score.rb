# frozen_string_literal: true

# Clase dedicada a la puntuacion
class Score
  attr_accessor :extra_ball, :frames

  def initialize
    @extra_ball = 0
    @frames = []
  end

  def add_frame(new_frame)
    @frames.push(new_frame)
    update_score
  end

  def show_score
    puts '____________________________________________________________________________'
    # Mostrar los valores de los rolls de cada frame
    show_rolls
    puts ''
    # Mostrar el resultado de cada frame
    show_total
    puts ''
  end

  private

  def update_score
    if @frames.length > 1
      if @frames[-2].spares?
        @frames[-2].total_frame += @frames[-1].ball1
      elsif @frames[-2].strikes?
        total_strike_plus = @frames[-1].ball1 + @frames[-1].ball2
        @frames[-2].total_frame += total_strike_plus
      end
      @frames[-1].total_frame += @frames[-2].total_frame
    end
    return unless @frames.length == 10 && (@frames[-1].strikes? || @frames[-1].spares?)

    @extra_ball = rand(0..10)
    @frames[-1].total_frame += @extra_ball
  end

  def show_rolls
    @frames.each do |frame|
      if frame.strikes?
        print("\t|X|")
      elsif frame.spares?
        print("\t#{frame.ball1}|/|")
      else
        print("\t#{frame.ball1}|#{frame.ball2}|")
      end
    end
    print @extra_ball if @extra_ball != 0
  end

  def show_total
    @frames.each do |frame|
      print("\t#{frame.total_frame}|")
    end
  end
end

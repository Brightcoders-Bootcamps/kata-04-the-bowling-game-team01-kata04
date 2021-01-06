# frozen_string_literal: true

class Score
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
      if @frames[-2].is_spare?
        @frames[-2].total_frame += @frames[-1].ball_1
      elsif @frames[-2].is_strike?
        total_strike_plus = @frames[-1].ball_1 + @frames[-1].ball_2
        @frames[-2].total_frame += total_strike_plus
      end
      @frames[-1].total_frame += @frames[-2].total_frame
    end
    if @frames.length == 10 && (@frames[-1].is_strike? || @frames[-1].is_spare?)
      @extra_ball = rand(0..10)
      @frames[-1].total_frame += @extra_ball
    end
  end

  def show_rolls
    @frames.each do |frame|
      if frame.is_strike?
        print("\t|X|")
      elsif frame.is_spare?
        print("\t#{frame.ball_1}|/|")
      else
        print("\t#{frame.ball_1}|#{frame.ball_2}|")
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

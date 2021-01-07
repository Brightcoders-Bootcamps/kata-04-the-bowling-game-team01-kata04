# frozen_string_literal: true

require_relative 'frame'
require_relative 'score'

current_score = Score.new

(1..10).each do |i|
  puts "Frame ##{i}"
  ball1 = rand(0..10)
  ball2 = if ball1 == 10
            0
          else
            rand(0..(10 - ball1))
          end
  current_frame = Frame.new(ball1, ball2)
  current_score.add_frame(current_frame)
  current_score.show_score
end

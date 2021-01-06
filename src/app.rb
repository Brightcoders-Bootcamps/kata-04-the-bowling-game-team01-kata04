require_relative 'frame'
require_relative 'score'

current_score = Score.new

(1..10).each do |i|
  puts "Frame ##{i}"
  ball_1 = rand(0..10)
  ball_2 = if ball_1 == 10
             0
           else
             rand(0..(10 - ball_1))
           end
  current_frame = Frame.new(ball_1, ball_2)
  current_score.add_frame(current_frame)
  current_score.show_score
end

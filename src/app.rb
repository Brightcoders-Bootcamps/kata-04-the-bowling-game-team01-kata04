require_relative 'frame.rb'
require_relative 'score.rb'

current_score = Score.new

for i in (1..10)
    puts "Frame ##{i}"
    ball_1 = rand(0..10)
    if ball_1 == 10
        ball_2 = 0
    else
        ball_2 = rand(0..(10-ball_1))
    end
    current_frame = Frame.new(ball_1, ball_2)
    current_score.add_frame(current_frame)
    current_score.show_score
end
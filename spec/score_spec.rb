# frozen_string_literal: true

require_relative '../src/score'
require_relative '../src/frame'

RSpec.describe Score do
  test_score = Score.new
  frame_strike = Frame.new(10, 0)
  frame_spare = Frame.new(6, 4)
  frame_normal = Frame.new(3, 4)

  it 'right attributes initialization' do
    expect(test_score.extra_ball).to eq(0)
    expect(test_score.frames).to eq([])
  end

  describe '#add_frame' do
    it 'before add frame' do
      expect(test_score.frames).to eq([])
    end

    it 'after add frame' do
      test_score.add_frame(frame_strike)
      expect(test_score.frames).not_to eq([])
    end

    it 'correct update frames' do
      expect(test_score.frames[0].total_frame).to eq(10)
      test_score.add_frame(frame_spare)
      expect(test_score.frames[0].total_frame).to eq(20)
      expect(test_score.frames[1].total_frame).to eq(30)
      test_score.add_frame(frame_normal)
      expect(test_score.frames[1].total_frame).to eq(33)
    end
  end
end

# frozen_string_literal: true

require_relative '../src/frame'

RSpec.describe Frame do
  frame_strike = Frame.new(10, 0)
  frame_spare = Frame.new(6, 4)
  frame_normal = Frame.new(3, 4)

  it 'right total frame if strike' do
    expect(frame_strike.total_frame).to eq(10)
  end

  it 'right total frame if spare' do
    expect(frame_spare.total_frame).to eq(10)
  end

  it 'right total frame if normal' do
    expect(frame_normal.total_frame).to eq(7)
  end

  describe '#is_strike?' do
    it 'if frame_strike is strike' do
      expect(frame_strike.is_strike?).to be_truthy
    end

    it 'if frame_spare is strike' do
      expect(frame_spare.is_strike?).to be_falsey
    end

    it 'if frame_normal is strike' do
      expect(frame_normal.is_strike?).to be_falsey
    end
  end

  describe '#is_spare?' do
    it 'if frame_strike is spare' do
      expect(frame_strike.is_spare?).to be_falsey
    end

    it 'if frame_spare is spare' do
      expect(frame_spare.is_spare?).to be_truthy
    end

    it 'if frame_normal is spare' do
      expect(frame_normal.is_spare?).to be_falsey
    end
  end
end

require_relative '../lib/Bowling'

describe Bowling, '#score' do
  let(:bowling) { Bowling.new }

  context 'when all rolls are gutter balls' do
    it 'returns a score of zero' do
      20.times { bowling.roll(0) }
      expect(bowling.score).to eq(0)
    end
  end

  context 'when all rolls knock down two pins' do
    it 'sums the pin count for each roll' do
      20.times { bowling.roll(2) }
      expect(bowling.score).to eq(40)
    end
  end

  context 'when a spare is scored' do
    it 'includes a bonus in the final score' do
      bowling.roll(7)
      bowling.roll(3)
      bowling.roll(2)
      bowling.roll(5)
      16.times { bowling.roll(0) }
      expect(bowling.score).to eq(19)
    end
  end

  context 'when a spare is scored in the last frame' do
    it 'does not include a bonus in the final score' do
      18.times { bowling.roll(0) }
      bowling.roll(7)
      bowling.roll(3)
      bowling.roll(2)
      expect(bowling.score).to eq(12)
    end
  end

  context 'when a strike is scored' do
    it 'includes the bonuses in the final score' do
      bowling.roll(10)
      bowling.roll(2)
      bowling.roll(5)
      16.times { bowling.roll(0) }
      expect(bowling.score).to eq(24)
    end
  end

  context 'when a strike is scored in the last frame' do
    it 'does not include a bonus in the final score' do
      18.times { bowling.roll(0) }
      bowling.roll(10)
      bowling.roll(2)
      bowling.roll(5)
      expect(bowling.score).to eq(17)
    end
  end

  context 'when three strikes are scored in a row' do
    it 'includes the bonuses in the final score' do
      3.times { bowling.roll(10) }
      14.times { bowling.roll(0) }
      expect(bowling.score).to eq(60)
    end
  end

  context 'when a perfect bowling is played' do
    it 'returns the highest score' do
      12.times { bowling.roll(10) }
      expect(bowling.score).to eq(300)
    end
  end
end

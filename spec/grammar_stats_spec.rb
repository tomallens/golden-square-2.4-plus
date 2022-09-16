require_relative '../lib/grammar_stats'

RSpec.describe GrammarStats do
  
  describe '#check' do
    it 'returns true a string with a capital start and sentence end' do
      grammar_stats = GrammarStats.new
      expect(grammar_stats.check('Block of text.')).to eq true
    end

    it 'returns false any other string' do
      grammar_stats = GrammarStats.new
      expect(grammar_stats.check('block of text')).to eq false
    end
  end

  describe '#percentage_good' do
    context 'given only good strings' do
      it 'returns 100(%)' do
        grammar_stats = GrammarStats.new
        grammar_stats.check('Block of text.')
        grammar_stats.check('Block of text.')
        expect(grammar_stats.percentage_good).to eq 100
      end
    end

    context 'given 1 bad and 1 good string' do
      it 'returns 50(%)' do
        grammar_stats = GrammarStats.new
        gram_store = grammar_stats.check('Block of text.')
        gram_store = grammar_stats.check('Block of text,')
        expect(grammar_stats.percentage_good).to eq 50
      end
    end
  end
end
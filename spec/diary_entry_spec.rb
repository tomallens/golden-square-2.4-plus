require_relative '../lib/diary_entry'

RSpec.describe DiaryEntry do
  it 'builds properly' do
    diary_entry = DiaryEntry.new("test title", "test contents")
    expect(diary_entry.title).to eq 'test title'
  end

  describe '#count_words' do
    it 'returns no. words in contents' do
      diary_entry = DiaryEntry.new("atitle", "these are some. conten7s")
      expect(diary_entry.count_words).to eq 4
    end
    
    it 'returns 0 for blank string' do
      diary_entry = DiaryEntry.new("title goes here", "")
      expect(diary_entry.count_words).to eq 0
    end
  end

  describe '#reading_time' do
    context 'when you give it a wpm integer (200)' do
      it 'returns ceiling of mins to read content' do
        diary_entry = DiaryEntry.new("test", "a " * 300)
        expect(diary_entry.reading_time(200)).to eq 2
      end
    end
  end

  describe '#reading_chunk' do
    context 'when passed contents readable in available reading time' do
      it 'returns whole contents' do
        diary_entry = DiaryEntry.new("test", "one two three")
        expect(diary_entry.reading_chunk(200, 1)).to eq "one two three"
      end
    end

    context 'when passed contents too long for available reading time' do
      it 'returns readable chunk' do
        diary_entry = DiaryEntry.new("test", "one two three")
        expect(diary_entry.reading_chunk(2, 1)).to eq "one two"
      end
    end
    
    context 'when called again' do
      it 'gives the next chunk of remaining contents after first call' do
        diary_entry = DiaryEntry.new("test", "one two three")
        diary_entry.reading_chunk(2, 1)
        chunk = diary_entry.reading_chunk(2, 1)
        expect(chunk).to eq "three"
      end
    end

    context 'once it reaches the end of the contents' do
      it 'starts again fresh' do
        diary_entry = DiaryEntry.new("test", "one two three")
        diary_entry.reading_chunk(2, 1)
        diary_entry.reading_chunk(2, 1)
        chunk = diary_entry.reading_chunk(2, 1)
        expect(chunk).to eq "one two"
      end
    end
  end
end
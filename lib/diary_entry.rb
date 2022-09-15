class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    @title = title
    @contents = contents
    @bookmark = 0
  end

  def title
    return @title
  end

  def contents
    return @contents
  end

  def count_words
    # Returns the number of words in the contents as an integer
    return @contents.split(' ').length
  end

  def reading_time(wpm) # wpm is an integer representing the number of words the
                        # user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # for the contents at the given wpm.
    return (count_words / 200.to_f).ceil
  end

  def reading_chunk(wpm, minutes) # `wpm` is an integer representing the number
                                  # of words the user can read per minute
                                  # `minutes` is an integer representing the
                                  # number of minutes the user has to read
    # Returns a string with a chunk of the contents that the user could read
    # in the given number of minutes.
    # If called again, `reading_chunk` should return the next chunk, skipping
    # what has already been read, until the contents is fully read.
    # The next call after that it should restart from the beginning.
    readable_words = wpm * minutes
    starting = @bookmark
    ending = @bookmark + readable_words
    words_in_question = words[starting, ending]
    if ending >= count_words
      @bookmark = 0
    else
      @bookmark = ending
    end
    return words_in_question.join(' ')
  end

private

  def words
    return @contents.split(' ')
  end
end
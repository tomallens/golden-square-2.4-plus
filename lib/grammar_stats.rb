class GrammarStats
  def initialize
    @true_count = 0
    @test_count = 0
  end

  def check(text) # text is a string
    # Returns true or false depending on whether the text begins with a capital
    # letter and ends with a sentence-ending punctuation mark.
    check_result = (text.match?(/^[A-Z]/) && text.match?(/[.!?]$/)) 
    if check_result == true 
      @true_count +=1
    end
    @test_count +=1
    return check_result
  end

  def percentage_good
    # Returns as an integer the percentage of texts checked so far that passed
    # the check defined in the `check` method. The number 55 represents 55%.
    @percentage_good = ((@true_count / @test_count.to_f) * 100).to_i
  end
end

tester = GrammarStats.new
tester.check('asfasdf')
tester.check('A!')
puts tester.percentage_good
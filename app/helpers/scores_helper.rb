module ScoresHelper
  
  BAD_WORDS = ['shit','crap','useless','poo','bad','arse','awful','sucked','balls']
  
  # Loop over the bad words and return the result
  def check_for_bad_words(tweet)
    tweet_text = tweet.text
    
    BAD_WORDS.each do |w|
      if tweet_text.include? w
        return true
      end
    end
    
    return false
  end
  
  def create_bad_score(contestant, contest)
    Rails.logger.info("Creating a BAD score for " + contestant.name)
    score = Score.new
    
    score.contestant = contestant
    score.value = -1 * contestant.multiplier
    score.contest = contest
    
    score.save
  end
  
  def create_good_score(contestant, contest)
    Rails.logger.info("Creating a GOOD score for " + contestant.name)
    score = Score.new
    
    score.contestant = contestant
    score.value = 1 * contestant.multiplier
    score.contest = contest
    
    score.save
  end
end

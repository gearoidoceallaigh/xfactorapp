class SearchJob < Struct.new(:url)
  
  include ScoresHelper
  include ContestsHelper
  include ContestantsHelper
  
  def perform
    # Get all the contestants
    contestants = Contestant.all

    contestants.each do |c|
      Rails.logger.info("Attempting to poll twitter for " + c.name)
      score_contestant(c)
    end

  end
  
  def clear_scores
    contestants = Contestant.all

    contestants.each do |c|
      Rails.logger.info("Clearing scores for " + c.name)
      reset_score_for_contest(c)
    end
  end
  
  # Poll twitter for each contestants term and create score where applicable
  def score_contestant(contestant)
    
    contest = is_contest_running
    
    unless contest.nil?
    
      require 'time'
      @client = TwitterSearch::Client.new('app4xfactor')
    
      unless contestant.nil?

        Rails.logger.info("Getting tweets for: " + contestant.name)
      
        contestant.search_terms.each do |s| 

          Rails.logger.info("Searching twitter for term: "  + s.value)

          tweets = @client.query :q => s.value, :rpp => '50'
          five_mins_ago = Time.now.to_i - 6000
          count = 0
          new_tweets = []
          tweets.each do |tweet|
            tweet_time = Time.parse(tweet.created_at).to_i    
                
            if (tweet_time > five_mins_ago)
              if check_for_bad_words(tweet)
                create_bad_score(contestant, contest)
              else
                create_good_score(contestant, contest)
              end
              
              update_latest_score_for_contest(contestant, contest)
            
              new_tweets.push(tweet)
            
            end
          end
          Rails.logger.info("number of new tweets:" + new_tweets.size.to_s)
        end
      
        Rails.logger.info('finished polling twitter for ' + contestant.name);
      end
    
      if contestant.nil?
        Rails.logger.debug("Couldn't locate contesant")
      end
    else
      reset_score_for_contest(contestant)
    end
  end
  
end
module ContestantsHelper
  
  def update_latest_score_for_contest(contestant, contest)
    
    Rails.logger.info("Updating new score for " + contestant.name)
    latest_score = Score.where("contestant_id = ? and contest_id = ?", contestant.id, contest.id).sum('value')
    Rails.logger.info("Latest score for " + contestant.name.to_s + " is " + latest_score.to_s)
    term_count = contestant.search_terms.size
    unless term_count.nil?
      contestant.latest_score = latest_score / term_count
    else
      contestant.latest_score = latest_score
    end
    contestant.save
    Rails.logger.info("Saving")
  end
  
  def reset_score_for_contest(contestant)
    
    Rails.logger.info("Resetting score for " + contestant.name)
    contestant.latest_score = 0
    contestant.save
    Rails.logger.info("Saving")
    
  end
  
end

module ContestantsHelper
  
  def update_latest_score_for_contest(contestant, contest)
    
    Rails.logger.info("Updating new score for " + contestant.name)
    latest_score = Score.where("contestant_id = ? and contest_id = ?", contestant.id, contest.id).sum('value')
    Rails.logger.info("Latest score for " + contestant.name.to_s + " is " + latest_score.to_s)
    contestant.latest_score = latest_score
    contestant.save
    Rails.logger.info("Saving")
    
  end
  
end

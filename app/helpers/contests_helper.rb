module ContestsHelper
  
  def is_contest_running
    
    require 'time'
    Rails.logger.info("Checking to see if contest is running")
    Rails.logger.info("Current time is: " + Time.now.to_s)
    
    contest = Contest.find(:first, :conditions => ["start <= ? AND end >= ?", Time.now, Time.now])
    
    unless contest.nil?
      Rails.logger.info("Contest with id " + contest.id.to_s + " found, returning.")
      return contest
    else
      Rails.logger.info("No contest found, returning.")
      return nil
    end
    
  end
  
end

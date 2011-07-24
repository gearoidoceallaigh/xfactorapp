class ApplicationController < ActionController::Base
  protect_from_forgery
  
  include ContestsHelper
  
  def schedule_job_for_12_hours
    require 'search_job'
    logger.info("Trying to schedule search jobs for 12 hours")
   
    i = 1
    while i < 145 do
       mins = i * 5
       Delayed::Job.enqueue SearchJob.new('me'), 0, 5.minutes.from_now.getutc
       i += 1
    end
    
    render 'home/index'
  end
  
  def debug
    debugger
  end
  
  def get_leaders
    logger.info("Leaderboard request made")
    
    contest = is_contest_running
    unless contest.nil?
      rankings = Contestant.select("name").where("eliminated = ?", false).order("latest_score DESC")
      unless rankings.nil?
        
        respond_to do |format|
          format.js  { render :json => rankings, :callback => params[:callback] }
          format.json  { render :json => rankings }
        end
        
      else
        render :json => "An error occured"
      end
    else
      render :json => "Voting closed"
    end
  end

end

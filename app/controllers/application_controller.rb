class ApplicationController < ActionController::Base
  protect_from_forgery
  
  include ContestsHelper
  
  def schedule_job
    require 'search_job'
    logger.info("Trying to schedule search job")
    Delayed::Job.enqueue SearchJob.new('me'), 0, 5.minutes.from_now.getutc
    Delayed::Job.enqueue SearchJob.new('me'), 0, 10.minutes.from_now.getutc
    Delayed::Job.enqueue SearchJob.new('me'), 0, 15.minutes.from_now.getutc
    Delayed::Job.enqueue SearchJob.new('me'), 0, 20.minutes.from_now.getutc
    Delayed::Job.enqueue SearchJob.new('me'), 0, 25.minutes.from_now.getutc
    
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

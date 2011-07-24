class ApplicationController < ActionController::Base
  protect_from_forgery
  
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

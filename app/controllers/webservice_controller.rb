class WebserviceController < ActionController::Base
  
  protect_from_forgery
  
  include ContestsHelper
  
  def get_leaders
    logger.info("Leaderboard request made")
    rankings = Contestant.all
    contest = is_contest_running
    unless contest.nil?
      rankings = Contestant.select("name").where("eliminated = ?", false).order("latest_score DESC")
      unless rankings.nil?
        
        respond_to do |format|
          format.js  { render :json => rankings, :callback => params[:callback] }
          format.json  { render :json => rankings }
        end
        
      else
        respond_to do |format|
          errors = {"error" => "An error occured, please try again later"}
          format.js  { render :json => errors, :callback => params[:callback] }
        end
      end
    else
      respond_to do |format|
        errors = {"error" => "Voting is closed. Rankings will be available when voting re-opens!"}
        format.js  { render :json => errors, :callback => params[:callback] }
      end
    end
  end
  
end
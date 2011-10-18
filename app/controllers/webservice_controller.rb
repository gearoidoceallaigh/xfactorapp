class WebserviceController < ActionController::Base
  
  protect_from_forgery
  
  LIVE_SHOWS_COMMENCED = true
  
  include ContestsHelper
  
  def get_leaders
    
    ip_addr = request.remote_ip
    logger.info("Leaderboard request made from " + ip_addr.to_s)
    metric = Metric.new
    metric.ip_address = ip_addr.to_s
    metric.tracking_type = "SCORES"
    metric.save
    
    if (LIVE_SHOWS_COMMENCED)
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
          errors = {"error" => "Due to creative redirection (and legal obligation) X Factor Predictor is now known as 
            F Xactor! It will be available shortly in the App Store and won't cost you anything to update."}
          format.js  { render :json => errors, :callback => params[:callback] }
        end
      end
    else
       respond_to do |format|
          errors = {"error" => "Due to creative redirection (and legal obligation) X Factor Predictor is now known as 
            F Xactor! It will be available shortly in the App Store and won't cost you anything to update."}
          format.js  { render :json => errors, :callback => params[:callback] }
        end
    end
  end
  
  def get_leaders_legally
    
    ip_addr = request.remote_ip
    logger.info("Leaderboard request made from " + ip_addr.to_s)
    metric = Metric.new
    metric.ip_address = ip_addr.to_s
    metric.tracking_type = "SCORES"
    metric.save
    
    if (LIVE_SHOWS_COMMENCED)
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
    else
       respond_to do |format|
          errors = {"error" => "The show's finalists have not been decided yet. Rankings will appear when the live shows begin!"}
          format.js  { render :json => errors, :callback => params[:callback] }
        end
    end
  end
  
  def get_leaders_test
      
      ip_addr = request.remote_ip
      logger.info("Leaderboard request made from " + ip_addr.to_s)
      metric = Metric.new
      metric.ip_address = ip_addr.to_s
      metric.tracking_type = "SCORES"
      metric.save
    
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
  
  def record_news_retreival
    ip_addr = request.remote_ip
    metric = Metric.new
    metric.ip_address = ip_addr.to_s
    metric.tracking_type = "NEWS"
    metric.save
  end
  
  def record_info_retreival
    ip_addr = request.remote_ip
    metric = Metric.new
    metric.ip_address = ip_addr.to_s
    metric.tracking_type = "INFO"
    metric.save
  end
  
  def record_twitter_retreival
    ip_addr = request.remote_ip
    metric = Metric.new
    metric.ip_address = ip_addr.to_s
    metric.tracking_type = "TWITTER"
    metric.save
  end
  
end
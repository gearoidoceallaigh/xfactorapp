class ApplicationController < ActionController::Base
  
  protect_from_forgery
  
  ADMIN_USER_NAME, ADMIN_PASSWORD = "ger", "5trang3day5"
  before_filter :authenticate
  
  def schedule_job_for_12_hours
    require 'search_job'
    logger.info("Trying to schedule search jobs for 12 hours")
   
    i = 1
    while i < 145 do
       mins = i * 5
       Delayed::Job.enqueue SearchJob.new('me'), 0, mins.minutes.from_now.getutc
       i += 1
    end
    
    render 'home/index'
  end
  
  def schedule_job_for_12_hours
    require 'search_job'
    logger.info("Trying to schedule search jobs for 12 hours")
   
    i = 1
    while i < 290 do
       mins = i * 5
       Delayed::Job.enqueue SearchJob.new('me'), 0, mins.minutes.from_now.getutc
       i += 1
    end
    
    render 'home/index'
  end
  
  
  def logged_in?
    logger.info("CALL 1")
  end
  
  def admin_logged_in?
    logger.info("CALL 2")
  end
  
  def authenticate
    authenticate_or_request_with_http_basic do |user_name, password|
      user_name == ADMIN_USER_NAME && password == ADMIN_PASSWORD
    end
  end
    

end

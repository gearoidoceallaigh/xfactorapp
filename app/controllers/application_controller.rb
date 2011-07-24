class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def schedule_job
    require 'search_job'
    logger.info("Trying to schedule search job")
    Delayed::Job.enqueue SearchJob.new('me'), 0, 5.minutes.from_now.getutc
    Delayed::Job.enqueue SearchJob.new('me'), 0, 10.minutes.from_now.getutc
    Delayed::Job.enqueue SearchJob.new('me'), 0, 15.minutes.from_now.getutc
    Delayed::Job.enqueue SearchJob.new('me'), 0, 20.minutes.from_now.getutc
    Delayed::Job.enqueue SearchJob.new('me'), 0, 25.minutes.from_now.getutc
  end
  
  def debug
    debugger
  end
end

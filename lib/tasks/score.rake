desc "This task is called by the Heroku cron add-on"

task :cron => :environment do
  require 'search_job'
  logger.info("Trying to schedule search job")
 
  i = 1
  while i < 289 do
     mins = i * 5
     Delayed::Job.enqueue SearchJob.new('me'), 0, 5.minutes.from_now.getutc
     i += 1
  end
end
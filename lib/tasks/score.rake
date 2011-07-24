desc "This task is called by the Heroku cron add-on"

task :cron => :environment do
  now = Time.now.to_i
  
  contests = Contests.all
  
  contests.each do |contest|
    start_time = contest.start_time.to_i
    end_time = contest.end_time.to_i
    
    if ((now >= start_time) && (now <= end_time))
      return true;
    end
    
    return false;
  end
end
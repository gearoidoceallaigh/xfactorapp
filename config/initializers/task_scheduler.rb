scheduler = Rufus::Scheduler.start_new

scheduler.every("1m") do
   sj = SearchJob.new
   sj.perform
end

scheduler.every("24h") do
   sj = SearchJob.new
   sj.clear_scores
end
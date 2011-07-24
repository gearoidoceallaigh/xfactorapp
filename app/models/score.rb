class Score < ActiveRecord::Base
  belongs_to :contestant
  belongs_to :contest
  
  def perform
    logger.info("IMMA DO IT!")
  end
  
end

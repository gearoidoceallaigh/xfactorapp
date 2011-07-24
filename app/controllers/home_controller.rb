class HomeController < ApplicationController
  def index
  end
  
  def let_me_pass?
    logger.info("got to let me pass")
    return true
  end

end

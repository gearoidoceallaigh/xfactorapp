class SearchTermsController < ApplicationController
  def create
      @contestant = Contestant.find(params[:contestant_id])
      @search_term = @contestant.search_terms.create(params[:search_term])
      redirect_to contestant_path(@contestant)
  end
  
  def destroy
    logger.info("DELETING USING THIS METHOD")
    @search_term = SearchTerm.find(params[:id])
    @search_term.destroy

    logger.info("RETURNING NOW REGULARLY")
    @contestant = Contestant.find(params[:contestant_id])
    redirect_to contestant_path(@contestant)    
  end
  
  def show
    puts 'blah'
  end
end

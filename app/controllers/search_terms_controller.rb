class SearchTermsController < ApplicationController
  def create
      @contestant = Contestant.find(params[:contestant_id])
      @search_term = @contestant.search_terms.create(params[:search_term])
      redirect_to contestant_path(@contestant)
  end
  
  def destroy
    debugger
    @search_term = SearchTerm.find(params[:id])
    @search_term.destroy

    respond_to do |format|
      format.html { redirect_to(contestants_url) }
      format.xml  { head :ok }
    end
  end
end

class ScoresController < ApplicationController

  include ScoresHelper

  # GET /scores
  # GET /scores.xml
  def index
    @scores = Score.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @scores }
    end
  end

  # GET /scores/1
  # GET /scores/1.xml
  def show
    @score = Score.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @score }
    end
  end

  # GET /scores/new
  # GET /scores/new.xml
  def new
    @score = Score.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @score }
    end
  end

  # GET /scores/1/edit
  def edit
    @score = Score.find(params[:id])
  end

  # POST /scores
  # POST /scores.xml
  def create
    @score = Score.new(params[:score])

    respond_to do |format|
      if @score.save
        format.html { redirect_to(@score, :notice => 'Score was successfully created.') }
        format.xml  { render :xml => @score, :status => :created, :location => @score }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @score.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /scores/1
  # PUT /scores/1.xml
  def update
    @score = Score.find(params[:id])

    respond_to do |format|
      if @score.update_attributes(params[:score])
        format.html { redirect_to(@score, :notice => 'Score was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @score.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /scores/1
  # DELETE /scores/1.xml
  def destroy
    @score = Score.find(params[:id])
    @score.destroy

    respond_to do |format|
      format.html { redirect_to(scores_url) }
      format.xml  { head :ok }
    end
  end
  
  def generate_scores
    require 'time'
    @client = TwitterSearch::Client.new('app4xfactor')
    id = params[:id]

    contestant = Contestant.find(id)

    unless contestant.nil? 
      logger.info("Getting tweets for: " + contestant.name)
      contestant.search_terms.each do |s| 
        logger.info("Searching twitter for term: "  + s.value)
        tweets = @client.query :q => s.value, :rpp => '50'
        five_mins_ago = Time.now.to_i - 6000
        count = 0
        new_tweets = []
        tweets.each do |tweet|
          tweet_time = Time.parse(tweet.created_at).to_i          
          if (tweet_time > five_mins_ago)
            if check_for_bad_words(tweet)
              create_bad_score(contestant)
            else
              create_good_score(contestant)
            end
            new_tweets.push(tweet)
          end
        end
        logger.info("number of new tweets:" + new_tweets.size.to_s)
        puts new_tweets.size
      end
      
      
      puts 'finished'
    end
    
    if contestant.nil?
      logger.debug("Couldn't locate contesant")
    end
    
  end
end

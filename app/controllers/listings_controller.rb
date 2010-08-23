class ListingsController < ApplicationController
  
  #before_filter :require_user
  #before_filter :require_no_user
  
  # GET /listings
  # GET /listings.xml
  def index
    if logged_in?
      @my_followers = current_user.twitter.get('/statuses/followers')
      @people_I_follow = current_user.twitter.get('/statuses/friends')
    end
    @my_followers ||= []
    @people_I_follow ||= []
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => [@my_followers, @people_I_follow] }
    end
  end
  
end

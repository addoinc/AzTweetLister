require File.dirname(__FILE__) + '/../spec_helper'

describe ListingsController do
  
  it "should display login link to non loogged in users" do
    get :index
    response.should be_success
    response.should_not have_tag("a", :text => "Log In Via twitter")
    assert_equal 0, assigns[:my_followers].length
    assert_equal 0, assigns[:people_I_follow].length
  end
  
  describe "after login" do
    
    it "should have non zero count for the two instance variable" do
      user = mock(:user)
      twitter = mock(:twitter_auth)
      user.should_receive(:twitter).twice.and_return(twitter)
      twitter.should_receive(:get).with('/statuses/followers').and_return((1..10).to_a)
      twitter.should_receive(:get).with('/statuses/friends').and_return((1..22).to_a)
      controller.stub!(:current_user).and_return(user)
      
      get :index
      response.should be_success
      response.should_not have_tag("a", :text => "Sign out")
      assert_equal 10, assigns[:my_followers].length
      assert_equal 22, assigns[:people_I_follow].length
    end
    
  end
  
end

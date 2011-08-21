require 'test_helper'
require 'minitest/autorun'

class VenuesControllerTest < ActionController::TestCase
  test "#index" do
    get :index
    assert_equal response.status, 200
  end

  test "#new with no user logged in" do
    get :new
    assert_redirected_to new_user_session_path
  end

  test "#new with a user logged in" do
    @user = users(:leigh)
    sign_in :user, @user
    get :new
    assert_template 'new'
  end

  test "#create with valid data" do
    @user = users(:leigh)
    sign_in :user, @user

    original_venue_count = Venue.count

    post :create, :venue => {:name => 'Doner Kebab', :description => 'Tasty Sandwiches'}

    assert_equal Venue.count - original_venue_count, 1
    assert_redirected_to venues_path
  end

  test "#create with invalid data" do
    @user = users(:leigh)
    sign_in :user, @user

    original_venue_count = Venue.count

    post :create, :venue => {:name => ''}
    assert_equal original_venue_count, Venue.count
    assert_template 'new'
  end
end

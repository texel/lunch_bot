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
end

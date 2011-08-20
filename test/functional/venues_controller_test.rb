require 'test_helper'
require 'minitest/autorun'

class VenuesControllerTest < ActionController::TestCase
  test "#index" do
    get :index
    assert_equal response.status, 200
  end
end

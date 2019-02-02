require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  test 'index redirects to / if parameter validation fails' do
    get users_url, params: { z: 'not q' }
    assert_redirected_to root_path
  end
end

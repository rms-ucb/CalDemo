require 'test_helper'

# an integration test just for fun
class FunTest < ActionDispatch::IntegrationTest
  test 'front page form test' do
    # Visit the index page
    get root_url

    assert_select 'h1', 'GitHub API on Rails'

    # Submit the form
    get users_url, params: { z: 'not the right param' }
    assert_response :redirect
    follow_redirect!

    # back on front page
    assert_select 'h1', 'GitHub API on Rails'
  end
end

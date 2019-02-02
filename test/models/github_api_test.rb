require 'test_helper'
# tests sometimes fail because of side-effects
# writing these tests show design flaws
class GithubAPITest < ActiveSupport::TestCase
  test 'short oath access token should throw an error' do
    connect = GithubAPI.new github_oath_access_token: 'foo'
    assert_not(connect.client)
  end

  test 'bad oath access token should throw an error' do
    connect = GithubAPI.new github_oath_access_token: '0' * 40
    assert_not(connect.client)
  end
end

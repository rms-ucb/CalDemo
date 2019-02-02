require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  test 'always return a 200 even when there are errors' do
    get events_url, params: { notid: 'not-id' }
    assert_response :success
  end
end

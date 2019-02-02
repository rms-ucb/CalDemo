class ApplicationController < ActionController::Base
  def github_api_client
    @github_api_connection = GithubAPI.new github_oath_access_token: Settings.GITHUB_OATH_ACCESS_TOKEN
    @github_api_connection.client
  end
end

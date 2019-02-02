class UsersController < ApplicationController
  def index
    redirect_to(root_url) && return unless validate
    results = github_api_client.search_users(params[:q], per_page: Settings.GITHUB_MAX_USER_RESULTS)
    @results_count = results.total_count
    @users = github_api_client.last_response.data.items
  end

  private

  def validate
    params.permit(:q)
    github_api_client.present? && params[:q].present?
  end
end

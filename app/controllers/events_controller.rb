class EventsController < ApplicationController
  def index
    github_api_client
  end

  def show
    redirect_to(root_url) && return unless validate
    @user = github_api_client.user(params[:id])
    @events = github_api_client.user_public_events(@user['login'])
  end

  private

  def validate
    params.permit(:id)
    github_api_client.present?
  end
end

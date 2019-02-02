# Manage connections to the GitHub API
class GithubAPI
  include ActiveModel::Model
  attr_accessor :github_oath_access_token

  @@client = nil

  def client
    @@client = connect if @@client.nil?
    return @@client
  end

  private

  # Connect to the GitHub API.
  # When exceptions ocurr, catch and log them, and provide a user error message
  #
  # @return <Octokit::Client>
  def connect
    if github_oath_access_token.present?
      client = Octokit::Client.new access_token: github_oath_access_token
    else
      client = Octokit::Client.new
      # TODO: show this as a warning, not an error, and make message more meaningful
      errors.add(:base, 'Missing GitHub API key ... requests may be limited or blocked')
    end
    Rails.logger.info client.rate_limit.to_yaml.to_s
    return client
  rescue StandardError => e
    errors.add(:base, 'Sorry, there was a problem connecting to the GitHub API')
    Rails.logger.error "#{e.class} -> #{e.message}"
    return false
  end
end

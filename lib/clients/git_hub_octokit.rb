class GitHubOctokit

  def initialize
    @github = setup_github_client
  end

  def user
    @github.user
  end

  def create_gist(params)
    @github.create_gist(params.to_json)
  end

  private

  def setup_github_client
    Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
  end
end

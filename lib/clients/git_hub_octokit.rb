class GitHubOctokit

  ACCESS_TOKEN = 'e39351600d9689d7967b8c16040fea349eb72d5e'.freeze

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
    Octokit::Client.new(access_token: ACCESS_TOKEN)
  end
end

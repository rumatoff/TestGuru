module ApplicationHelper
  FORM_TITLE = { new: 'Create New', edit: 'Edit' }.freeze

  def current_year
    Time.current.year
  end

  def github_url_by(author, repo)
    link_to author, "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def github_url(author, repo)
    link_to repo, "https://github.com/#{author}/#{repo}", target: '_blank'
  end
end

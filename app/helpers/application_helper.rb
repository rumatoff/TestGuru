module ApplicationHelper

  def current_year
    Time.current.year
  end

  def github_url_by(author, repo)
    link_to author, "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def github_url(author, repo)
    link_to repo, "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flash_message(message, type)
    content_tag :div, message, class: "alert #{type}"
  end
end

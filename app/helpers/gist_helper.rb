module GistHelper

  def gist_hash(gist)
    gist.url.split('/').last
  end

  def gist_title(gist)
    gist.question.body.truncate(25)
  end
end

module GistHelper

  def gist_hash(gist)
    URI.parse(gist.gist_url).path[1..-1]
  end

  def gist_title(gist)
    gist.question.body[0..24]
  end
end

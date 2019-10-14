class GistQuestionService

  def initialize(question, client = default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    result = Struct.new(:response) do
      def success?
        response[:html_url].present?
      end

      def html_url
        response[:html_url]
      end
    end
    result[@client.create_gist(gist_params)]
  end


  private

  def default_client
    GitHubOctokit.new
  end

  def gist_params
    {
      description: I18n.t('.title', title: @test.title),
      files: {
        "test-guru-question.txt": {
          "content": gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end

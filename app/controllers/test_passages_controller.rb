class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update result gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call

    flash_options = gist_create(result[:html_url])

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def gist_create(url)
    @gist = current_user.gists.new(question_id: @test_passage.current_question.id, gist_url: url, user_id: current_user.id)
    if @gist.save
      { notice: "#{t('.gist.success')} #{url}" }
    else
      { alert: t('.gist.failure') }
    end
  end
end

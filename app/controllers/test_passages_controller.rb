class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update result gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      assign_badges
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    response = GistQuestionService.new(@test_passage.current_question).call

    if response.success?
      Gist.create(question_id: @test_passage.current_question.id, url: response.html_url, user_id: current_user.id)
      flash[:notice] = "#{t('.gist.success')} #{view_context.link_to('Github', response.html_url, target: '__blank')}"
    else
      flash[:alert] = t('.gist.failure')
    end

    redirect_to @test_passage
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def assign_badges
    new_badges = BadgeService.new(@test_passage).call
    current_user.badges << new_badges
  end
end

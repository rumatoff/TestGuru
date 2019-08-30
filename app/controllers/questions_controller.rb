class QuestionsController < ApplicationController

  before_action :find_test

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = Question.all.where(test_id: params[:test_id])
  end

  def show
    @question = Question.find(params[:id])

    respond_to do |format|
      format.html
      format.text { render plain: @question.body }
    end
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to @question
    else
      render 'new'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    redirect_to test_questions_path(params[:test_id])
  end

  private

  def question_params
    params.require(:question).permit(:body, :test_id)
  end

  def find_test
    @test = Test.find(params[:test_id]) if params[:test_id]
  end

  def rescue_with_question_not_found
    render plain: 'Question not found'
  end
end

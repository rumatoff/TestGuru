class QuestionsController < ApplicationController

  before_action :set_test, only: %i[index new create destroy]
  before_action :set_question, only: %i[show destroy edit update]
  before_action :set_test_by, only: %i[edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = Question.all.where(test_id: params[:test_id])
  end

  def show
    respond_to do |format|
      format.html
      format.text { render plain: @question.body }
    end
  end

  def new
    @question = @test.questions.build
  end

  def create
    @question = @test.questions.build(question_params)

    if @question.save
      redirect_to test_questions_path(@test)
    else
      render 'new'
    end
  end

  def destroy
    @question.destroy

    redirect_to test_questions_path(@test)
  end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to test_questions_path(@test)
    else
      render 'edit'
    end
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def set_test_by
    question = set_question
    @test = Test.find(question.test_id)
  end

  def rescue_with_question_not_found
    render plain: 'Question not found'
  end
end

class QuestionsController < ApplicationController

  before_action :find_test, only: %i[index new create destroy]
  before_action :find_question, only: %i[show destroy edit update]
  before_action :find_test_by, only: %i[edit]

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
      redirect_to question_path(@question)
    else
      render 'edit'
    end
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test_by
    question = find_question
    @test = Test.find(question.test_id)
  end

  def rescue_with_question_not_found
    render plain: 'Question not found'
  end
end

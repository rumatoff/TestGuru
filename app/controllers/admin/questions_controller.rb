class Admin::QuestionsController < ApplicationController

  before_action :set_test, only: %i[new create]
  before_action :set_question, only: %i[show destroy edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

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
      redirect_to admin_test_path(@test)
    else
      render 'new'
    end
  end

  def destroy
    @question.destroy

    redirect_to admin_test_path(@question.test)
  end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to admin_test_path(@question.test)
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

  def rescue_with_question_not_found
    render plain: 'Question not found'
  end
end

class Admin::AnswersController < ApplicationController
  before_action :set_answer, only: %i[show edit update destroy]
  before_action :set_question, only: %i[new create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_answer_not_found

  def show; end

  def new
    @answer = @question.answers.build
  end

  def edit; end

  def create
    @answer = @question.answers.build(answer_params)

    if @answer.save
      redirect_to admin_question_path(@question)
    else
      render 'new'
    end
  end

  def update
    if @answer.update(answer_params)
      redirect_to admin_question_path(@answer.question)
    else
      render 'edit'
    end
  end

  def destroy
    @answer.destroy

    redirect_to admin_question_path(@answer.question)
  end

  private

  def set_question
    @question = Question.find(params[:question_id])
  end

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:body, :correct)
  end

  def rescue_with_answer_not_found
    render plain: 'Answer not found'
  end
end

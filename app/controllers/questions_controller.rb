class QuestionsController < ApplicationController
  def index
    @questions = Question.all.where(test_id: params[:test_id])
    # @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end
end

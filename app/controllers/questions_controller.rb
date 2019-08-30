class QuestionsController < ApplicationController
  def index
    @questions = Question.all.where(test_id: params[:test_id])
  end

  def show
    @question = Question.find(params[:id])
  end

  def new

  end
end

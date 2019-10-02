class Admin::TestsController < Admin::BaseController

  before_action :set_test, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def show; end

  def new
    @test = Test.new
  end

  def edit; end

  def create
    @test = User.first.my_tests.new(test_params)

    if @test.save
      redirect_to admin_tests_path
    else
      render 'new'
    end
  end

  def update
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render 'edit'
    end
  end

  def destroy
    @test.destroy

    redirect_to admin_tests_path
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :category_id)
  end

  def rescue_with_test_not_found
    render plain: 'Test not found'
  end
end

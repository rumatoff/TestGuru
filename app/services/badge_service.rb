class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def call
    Badge.all.select do |badge|
      send("assign_#{badge.rule}?", badge.condition)
    end
  end

  private

  def assign_all_in_category?(category)
    if @test.category.title == category && @test_passage.passed?
      Test.by_category(category).count == @user.tests.by_category(category).uniq.count
    end
  end

  def assign_first_try_success?(condition)
    @user.tests.where(id: @test.id).count == 1 if @test_passage.passed?
  end

  def assign_all_in_level?(level)
    Test.by_level(level).count == @user.tests.by_level(@test.level).uniq.count
  end
end

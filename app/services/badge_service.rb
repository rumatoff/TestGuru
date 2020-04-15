class BadgeService
  RULES = %w[all_in_category first_try_success all_in_level].freeze
  
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def call
    return unless @test_passage.passed?

    Badge.all.select { |badge| send("assign_#{badge.rule}?", badge.condition) }
  end

  private

  def assign_all_in_category?(category)
    return unless @test.category.title == category

    tests = Test.by_category(category).ids
    check(tests, 'all_in_category', category)
  end

  def assign_first_try_success?(condition)
    @user.tests.where(id: @test.id).count == 1
  end

  def assign_all_in_level?(level)
    return unless @test.level.to_i == level.to_i

    tests = Test.by_level(level).ids
    check(tests, 'all_in_level', level)
  end

  def check(tests, rule, condition)
    badge = @user.badges.where(rule: rule, condition: condition).last

    if badge.present?
      last_assignment = @user.user_badges.where(badge_id: badge.id).last
      attempts = TestPassage.all_success_attempts(@user.id, tests).after(last_assignment.created_at).pluck(:test_id).uniq
    else
      attempts = TestPassage.all_success_attempts(@user.id, tests).pluck(:test_id).uniq
    end

    attempts.count == tests.count
  end
end


class User < ApplicationRecord
  def tests_by_level(level)
    join = 'INNER JOIN results ON results.test_id = tests.id INNER JOIN users ON
          results.user_id = users.id'
    Test.joins(join).where(results: { user_id: id }, tests: { level: level })
  end
end

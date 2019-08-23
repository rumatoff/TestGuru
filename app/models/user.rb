class User < ApplicationRecord
  def tests_by_level(level)
    Test.joins("INNER JOIN results ON results.test_id = tests.id INNER JOIN users ON results.user_id = users.id WHERE users.id = #{id} AND tests.level = #{level}").pluck(:title)
  end
end

# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories = Category.create([{ title: 'Backend' },
                              { title: 'Frontend' },
                              { title: 'Machine Learning' }])
tests = Test.create([{ title: 'Ruby', level: 1, category_id: categories[0].id },
                     { title: 'HTML/CSS', level: 2, category_id: categories[1].id },
                     { title: 'Rails', level: 3, category_id: categories[0].id },
                     { title: 'Python', level: 3, category_id: categories[2].id },
                     { title: 'Django', level: 5, category_id: categories[0].id }])
users = User.create([
                      { first_name: 'Erich', last_name: 'Gamma' },
                      { first_name: 'Richard', last_name: 'Helm' },
                      { first_name: 'John', last_name: 'Vlissides' },
                      { first_name: 'Ralph', last_name: 'Johnson' }
                    ])
Result.create([
                { status: 'incompleted', user_id: users[3].id, test_id: tests[0].id },
                { status: 'incompleted', user_id: users[1].id, test_id: tests[0].id },
                { status: 'completed', user_id: users[2].id, test_id: tests[1].id },
                { status: 'completed', user_id: users[3].id, test_id: tests[0].id },
                { status: 'completed', user_id: users[0].id, test_id: tests[2].id },
                { status: 'completed', user_id: users[0].id, test_id: tests[2].id },
                { status: 'completed', user_id: users[2].id, test_id: tests[3].id },
                { status: 'incompleted', user_id: users[0].id, test_id: tests[3].id }
              ])

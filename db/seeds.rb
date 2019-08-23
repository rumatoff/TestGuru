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
tests = Test.create([{ title: 'Ruby', level: 1, category_id: 1 },
                     { title: 'HTML/CSS', level: 2, category_id: 2 },
                     { title: 'Rails', level: 3, category_id: 1 },
                     { title: 'Python', level: 3, category_id: 3 },
                     { title: 'Django', level: 5, category_id: 1 }])
users = User.create([
                      { first_name: 'Erich', last_name: 'Gamma' },
                      { first_name: 'Richard', last_name: 'Helm' },
                      { first_name: 'John', last_name: 'Vlissides' },
                      { first_name: 'Ralph', last_name: 'Johnson' }
                    ])
results = Result.create([
                          { status: 'incompleted', user_id: 4, test_id: 1 },
                          { status: 'incompleted', user_id: 2, test_id: 1 },
                          { status: 'completed', user_id: 3, test_id: 2 },
                          { status: 'completed', user_id: 4, test_id: 1 },
                          { status: 'completed', user_id: 1, test_id: 2 },
                          { status: 'completed', user_id: 2, test_id: 3 },
                          { status: 'completed', user_id: 3, test_id: 4 },
                          { status: 'incompleted', user_id: 1, test_id: 5 }
                        ])

# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create!([
                         { first_name: 'Erich', last_name: 'Gamma', email: 'test1@test.su' },
                         { first_name: 'Richard', last_name: 'Helm', email: 'test2@test.su' },
                         { first_name: 'John', last_name: 'Vlissides', email: 'test3@test.su' },
                         { first_name: 'Ralph', last_name: 'Johnson', email: 'test4@test.su' }
                     ])

categories = Category.create!([{ title: 'Backend' },
                               { title: 'Frontend' },
                               { title: 'Machine Learning' }])
tests = Test.create!([{ title: 'Ruby', level: 1, category_id: categories[0].id, author_id: users[0].id },
                      { title: 'HTML/CSS', level: 2, category_id: categories[1].id, author_id: users[0].id },
                      { title: 'Rails', level: 3, category_id: categories[0].id, author_id: users[1].id },
                      { title: 'Python', level: 3, category_id: categories[2].id, author_id: users[2].id },
                      { title: 'Django', level: 5, category_id: categories[0].id, author_id: users[3].id }])
questions = Question.create!([
    { body: 'How will you define Ruby programming Language?', test_id: tests[0].id },
    { body: 'What is the command to get installed Ruby version in your system?', test_id: tests[0].id }
                             ])
answers = Answer.create!([
    { body: 'Ruby is a dynamic, reflective, general-purpose, open-source programming language that focuses on simplicity and productivity. Ruby is a pure object-oriented programming language with simple in appearance and complex inside.', correct: true, question_id: questions[0].id },
    { body: 'Ruby? What is it?', question_id: questions[0].id },
    { body: 'Ruby? Like PHP?', question_id: questions[0].id },
    { body: 'There is no right answer.', question_id: questions[0].id },
    { body: 'There is no right answer.', question_id: questions[1].id },
    { body: 'Ruby –v', correct: true, question_id: questions[1].id },
    { body: 'format c:', question_id: questions[1].id }
                         ])

# TestPassage.create!([
#                    { user_id: users[3].id, test_id: tests[0].id,  },
#                    { status: 'incompleted', user_id: users[1].id, test_id: tests[0].id },
#                    { status: 'completed', user_id: users[2].id, test_id: tests[1].id },
#                    { status: 'completed', user_id: users[3].id, test_id: tests[0].id },
#                    { status: 'completed', user_id: users[0].id, test_id: tests[2].id },
#                    { status: 'completed', user_id: users[0].id, test_id: tests[2].id },
#                    { status: 'completed', user_id: users[2].id, test_id: tests[3].id },
#                    { status: 'incompleted', user_id: users[0].id, test_id: tests[3].id }
#                ])

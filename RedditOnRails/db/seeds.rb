# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users = ['Tom', 'Sarah', 'Mark', 'Matt', 'Torah']
users.each do |u|
  User.create(username: u, password: '123456')
end

subs = ['Appacademy', 'SanFran', 'Lunch', 'The Weekend', 'Sex']

posts = ['This is SOO COOOL!', 'I HATE this guy', 'Oh, MY, GOD!!']

subs.each_with_index do |s, i|
  sub = Sub.create(title: s, description: (s * 3), moderator_id: (i + 1))
  posts.each_with_index do |post, j|
    Post.create(title: post, content: (post * 5), sub_id: sub.id, author_id: j + 1)
  end
end

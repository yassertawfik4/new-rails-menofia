# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

PostEditor.destroy_all
Post.destroy_all
Editor.destroy_all
User.destroy_all

user1 = User.create!(
  name: "Ahmed",
  age: 30
)

user2 = User.create!(
  name: "Sara",
  age: 28
)

editor1 = Editor.create!(
  name: "Mona",
  email: "mona@example.com"
)

editor2 = Editor.create!(
  name: "Omar",
  email: "omar@example.com"
)

post1 = Post.create!(
  title: "First Post",
  user_id: user1.id
)

post2 = Post.create!(
  title: "Second Post",
  user_id: user2.id
)

PostEditor.create!(post: post1, editor: editor1)
PostEditor.create!(post: post1, editor: editor2)
PostEditor.create!(post: post2, editor: editor2)

puts "Seed data created successfully!"

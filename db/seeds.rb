User.create!(name: "Tehilla", email: "tehilla@email.com", password: "password")
User.create!(name: "Rachel", email: "rachel@email.com", password: "password")
User.create!(name: "Ariella", email: "ariella@email.com", password: "password")

Category.create!(name: "food")
Category.create!(name: "home")
Category.create!(name: "clothing")
Category.create!(name: "travel")

Task.create!(description: "fix bookshelf", user_id: 2, category_id: 2, completed: "FALSE", duration: 60, due_date: 20.days.from_now)
Task.create!(description: "buy milk", user_id: 1, category_id: 1, completed: "FALSE", duration: 20, due_date: 5.days.from_now)
Task.create!(description: "pick up dry cleaning", user_id: 2, category_id: 3, completed: "FALSE", duration: 30, due_date: 13.days.from_now)
Task.create!(description: "plan weekly menu", user_id: 3, category_id: 1, completed: "FALSE", duration: 45, due_date: 3.days.from_now)
Task.create!(description: "clean room", user_id: 1, category_id: 2, completed: "FALSE", duration: 75)

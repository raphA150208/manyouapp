User.create!(name: "obito", email: "obito@email.com", password: "rinnegan", password_confirmation: "rinnegan", admin: true)

10.times do |n|name = Faker::JapaneseMedia::Naruto.character
  email = Faker::Internet.email
  password = "password"
  password_confirmation = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password_confirmation,
               admin: false
              )
end

10.times do |n|
  Label.create!(
    name: "ラベル#{n + 1}"
  )
end

10.times do |n|
  user_id = n + 1
  Task.create!(
    title: "task#{n + 1}",
    content: "content#{n + 1}",
    due_date: "2021-10-22 00:00:00",
    status: "未着手",
    priority: "低",
    user_id: user_id
  )
end
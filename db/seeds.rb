1.times do |n|
  name = Faker::JapaneseMedia::Naruto.character
  email = Faker::Internet.email
  password = "password"
  password_confirmation = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password_confirmation,
               admin: true
              )
end

Label.create([
  { name: 'ラベル1' },
  { name: 'ラベル2' },
  { name: 'ラベル3' },
  { name: 'ラベル4' },
  { name: 'ラベル5' }
])
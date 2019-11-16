20.times do |n|
  email = "test#{n}@test.com"
  password = "12345678"
  name = Faker::JapaneseMedia::OnePiece.character
  User.create!(name: name,
                email: email,
               password: password,
               password_confirmation: password,
               prefecture_id: round(1..47),
               country_id: round(1..197)
               )
end
40.times do
  number = User.all.length
  Relationship.create!(
    follower_id: round(1..number),
    following_id: round(1..number)
  )
end
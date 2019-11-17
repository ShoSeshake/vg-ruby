20.times do |n|
  email = "test#{n}@test.com"
  password = "12345678"
  name = "Test Account #{n}"
  User.create!(name: name,
                email: email,
               password: password,
               password_confirmation: password,
               prefecture_id: rand(1..47),
               country_id: rand(1..197)
               )
end
18.times do |n|
  n+=2
  number = User.all.length
  Relationship.create!(
    follower_id: 1,
    following_id: n
  )
  Relationship.create!(
    follower_id: n,
    following_id: 1
  )
end
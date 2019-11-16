# # follow for test user

users = (User.all.length - 2)
users.times do |n|
  n+=2
  Relationship.create!(
    follower_id: 1,
    following_id: n
  )
  Relationship.create!(
    follower_id: n,
    following_id: 1
  )
end
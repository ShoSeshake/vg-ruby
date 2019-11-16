# # seed message
user_length = User.all.length
50.times do
user = User.find(rand(1..user_length))
  if  user.chats.present?
    user.chats.each do |c|
      Message.create!(
        user_id: user.id,
        chat_id: c.id,
        content: Faker::Quote.famous_last_words
      )
    end
  end
end
50.times do
  user = User.find(rand(1..user_length))
    if  user.chats.present?
      user.chats.each do |c|
        Message.create!(
          user_id: user.id,
          chat_id: c.id,
          content: Faker::Movies::HarryPotter.quote
        )
    end
  end
end
50.times do
  user = User.find(rand(1..user_length))
    if  user.chats.present?
      user.chats.each do |c|
        Message.create!(
          user_id: user.id,
          chat_id: c.id,
          content: Faker::Quote.most_interesting_man_in_the_world
        )
    end
  end
end
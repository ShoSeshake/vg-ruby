json.array! @messages do |message|
  json.content message.content if message.content.present?
  json.url message.url if message.url.present?
  json.created_at message.created_at.to_s(:datetime)
  json.user_name message.user.name
  json.id message.id
  json.chat_message message.chat.show_last_message.truncate(30)
end
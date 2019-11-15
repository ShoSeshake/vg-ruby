
# salad = Category.create(name:"Salad")
# pasta = Category.create(name:"Pasta")
# noodle = Category.create(name:"Noodle")
# deepfried= Category.create(name:"Deepfried")
# soup = Category.create(name:"Soup")
# stew = Category.create(name:"Stew/Nabe")
# donburi = Category.create(name:"Donburi")
# curry = Category.create(name:"Curry")
# bread = Category.create(name:"Bread")
# hamburger = Category.create(name:"Hamburger")
# sauce = Category.create(name:"Dressing/Sauce")
# dessert = Category.create(name:"Dessert")
# drink = Category.create(name:"Drink")

# bulbs = Ingredient.create(name:"Bulbs")
# bulbs.children.create([{name:"Fennel"},{name:"Garlic"},{name:"Leeks"},{name:"Red Onions"},{name:"White Onions"},{name:"Shallots"},{name:"Spring onions"}])
# flowers = Ingredient.create(name:"Flowers")
# flowers.children.create([{name:"Broccoli"},{name:"Cauliflower"}])
# leaves = Ingredient.create(name:"Leaves")
# leaves.children.create([{name:"Brussel sprouts"},{name:"Cabbages"},{name:"Red Cabbages"},{name:"Savoy Cabbages"},{name:"Kale"},{name:"Lettuce"},{name:"Microgreens"},{name:"Salad greens"},{name:"Sliverbeet"},{name:"Spinach"},{name:"Watercress"},{name:"Witloof"},{name:"Bok Choi"}])
# stems = Ingredient.create(name:"Stems")
# stems.children.create([{name:"Asparagus"},{name:"Celery"},{name:"Kohlabi"},{name:"Rhuburb"}])
# seeds = Ingredient.create(name:"Seeds")
# seeds.children.create([{name:"Corns"},{name:"Bean sprouts"},{name:"Green beans"},{name:"Butter beans"}])
# bean = Ingredient.create(name:"Bean")
# bean.children.create([{name:"Soy bean"},{name:"Edamame"},{name:"Green pea"},{name:"Broad Bean"},{name:"Chickpea"},{name:"Green bean"},{name:"Kidney bean"},{name:"Sugarsnap"},{name:"Azuki bean"}])
# mushroom = Ingredient.create(name:"Mushrooms")
# mushroom.children.create([{name:"Shiitake mushrooms"},{name:"Shimeji mushrooms"},{name:"Eringi mushrooms"},{name:"Button mushrooms"},{name:"Portabellos"}])
# roots = Ingredient.create(name:"Roots")
# roots.children.create([{name:"Beetroots"},{name:"Carrots"},{name:"Celeriac"},{name:"Ginger"},{name:"Parsnips"},{name:"Radishes"},{name:"White Radishes"},{name:"Swedes"},{name:"Turnips"}])
# tubers = Ingredient.create(name:"Tubers")
# tubers.children.create([{name:"Potatoes"},{name:"Sweet potatoes"},{name:"Yums"},{name:"Taro"},{name:"Satoimo"}])
# herbs = Ingredient.create(name:"Herbs")
# herbs.children.create([{name:"Angelica"},{name:"Basil"},{name:"Thai Basil"},{name:"Bay"},{name:"Borage"},{name:"Chervil"},{name:"Chives"},{name:"Calendula Flowers"},{name:"Coriander"},{name:"Cornflowers"},{name:"Curly Kale"},{name:"Dill"},{name:"Lemon balm"},{name:"Lemongrass"},{name:"Lovage"},{name:"Marigold"},{name:"Majoram"},{name:"Mint"},{name:"Vietname Mint"},{name:"Nasturtium"},{name:"Oregano"},{name:"Parsley"},{name:"Pansy"},{name:"Rosemary"},{name:"Sage"},{name:"Salad burnet"},{name:"Savory"},{name:"Tarragon"},{name:"Thyme"},{name:"Verbena"},{name:"Wasabi"}])
# fruits = Ingredient.create(name:"Fruits(non-sweet)")
# fruits.children.create([{name:"Eggplant/Aubergine"},{name:"Cucumber"},{name:"Pumpkin"},{name:"Tomato"},{name:"Pepper"},{name:"Bell pepper"},{name:"Sweet Pepper"},{name:"Capsicum"}])
# fruit = Ingredient.create(name:"Fruits")
# fruit.children.create([{name:"Strawberry"},{name:"Blueberry"},{name:"Raspberry"},{name:"Kiwi"},{name:"Orange"},{name:"Lemon"},{name:"Yuzu"},{name:"Lime"},{name:"Mango"},
#   {name:"Pineapple"},{name:"Apple"},{name:"Pear"},{name:"Papaya"},{name:"Lychee"}])
# nuts = Ingredient.create(name:"Nuts")
# nuts.children.create([{name:"Peanuts"},{name:"Almonds"},{name:"Cashewnuts"}])
# noodle = Ingredient.create(name:"Noodle")
# noodle.children.create([{name:"Udon"},{name:"Soba"},{name:"Ramen"}])
# seasoning = Ingredient.create(name:"Seasoning")
# seasoning.children.create([{name:"Salt"},{name:"Blackpepper"},{name:"Vegan Mayonaise"},{name:"Ketchup"},{name:"Mustard"},{name:"Paprika"},{name:"Chili Powder"},{name:"Sake"},{name:"Mirin"},{name:"Sugar"}])
# oil = Ingredient.create(name:"Oil")
# oil.children.create([{name:"Canola oil"},{name:"Olive oil"},{name:"Grapeseed oil"},{name:"Coconut oil"},
#   {name:"Raspseed oil"}])

# Genre.create([{genre:"Japanese"},{genre:"Chinese"},{genre:"American"},{genre:"Korean"},{genre:"Mexican"},{genre:"Filipino"},{genre:"British"},{genre:"French"},{genre:"Italian"},{genre:"Spanish"},{genre:"German"},{genre:"Brazilian"},{genre:"Thai"},{genre:"Vietnamese"},{genre:"Indian"},{genre:"Russian"},{genre:"African"},{genre:"Australian"},{genre:"Turkish"},{genre:"Moroccan"},{genre:"Sushi"},{genre:"BBQ"},{genre:"Nabe"},{genre:"Izakaya"},{genre:"Bar"},{genre:"Cafe"},{genre:"Buffet"},{genre:"Bento"}])

# # user create

# 20.times do |n|
#   n += number
#   # email = "sample#{n}@sample.com"
#   email = Faker::Internet.email
#   password = "12345678"
#   name = Faker::FunnyName.name
#   User.create!(name: name,
#                 email: email,
#                password: password,
#                password_confirmation: password,
#                prefecture_id: rand(1..47),
#                country_id: rand(1..197)
#                )
# end


# # follow for test user

# users = (User.all.length - 2)
# users.times do |n|
#   n+=2
#   Relationship.create!(
#     follower_id: 1,
#     following_id: n
#   )
#   Relationship.create!(
#     follower_id: n,
#     following_id: 1
#   )
# end

# users = (User.all.length - 2)
# recipes = Recipe.all.length
# users.times do |n|
#   Like.create!(
#     recipe_id: rand(1..recipes),
#     user_id: n+1
#   )
# end


# # seed message
# user_length = User.all.length
# 50.times do
# user = User.find(rand(1..user_length))
#   if  user.chats.present?
#     user.chats.each do |c|
#       Message.create!(
#         user_id: user.id,
#         chat_id: c.id,
#         content: Faker::Quote.famous_last_words
#       )
#     end
#   end
# end
# 50.times do
#   user = User.find(rand(1..user_length))
#     if  user.chats.present?
#       user.chats.each do |c|
#         Message.create!(
#           user_id: user.id,
#           chat_id: c.id,
#           content: Faker::Movies::HarryPotter.quote
#         )
#     end
#   end
# end
# 50.times do
#   user = User.find(rand(1..user_length))
#     if  user.chats.present?
#       user.chats.each do |c|
#         Message.create!(
#           user_id: user.id,
#           chat_id: c.id,
#           content: Faker::Quote.most_interesting_man_in_the_world
#         )
#     end
#   end
# end
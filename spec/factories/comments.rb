
FactoryBot.define do

  factory :comment, class: Comment do
    text              {Faker::Quote.famous_last_words}
    review            {1}
    user
    recipe
  end
end
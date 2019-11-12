FactoryBot.define do

  factory :comment, class: Comment do
    text              {Faker::Quote.famous_last_words}
    review            {round(4)}
    user
    recipe
  end
end
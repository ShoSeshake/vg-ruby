
FactoryBot.define do

  factory :instruction, class: Instruction do
    text              {Faker::Quote.famous_last_words}
    position             {1}
  end
end
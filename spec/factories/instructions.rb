FactoryBot.define do

  factory :instruction, class: Instruction do
    text              {Faker::Quote.famous_last_words}
  end
end
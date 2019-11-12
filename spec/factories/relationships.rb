FactoryBot.define do

  factory :relationship, class: Relationship do
    following_id          {round(10)}
    follower_id           {round(10)}
  end
end
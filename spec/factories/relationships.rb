FactoryBot.define do
  factory :relationship, class: Relationship do
    following_id          {1}
    follower_id           {1}
    # follower
    # following
  end
end
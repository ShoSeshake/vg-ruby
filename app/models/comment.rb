class Comment < ApplicationRecord
  belongs_to :recipe
  belongs_to :user
  validates :text, :review, presence: true

  ransacker :comments_count do
    query = '(SELECT COUNT(comments.recipe_id) FROM comments where comments.recipe_id = recipes.id GROUP BY comments.recipe_id)'
    Arel.sql(query)
  end

end

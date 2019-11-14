class Like < ApplicationRecord
  belongs_to :recipe
  belongs_to :user
  
  ransacker :likes_count do
    query = '(SELECT COUNT(likes.recipe_id) FROM likes where likes.recipe_id = recipes.id GROUP BY likes.recipe_id)'
    Arel.sql(query)
  end

end

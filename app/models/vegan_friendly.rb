class VeganFriendly < ActiveHash::Base
  self.data = [
      {id: 1, name: 'Completely vegan'}, {id: 2, name: 'They can change some dishes to vegan'}, {id: 3, name: 'They have vegan menu as well'},
      {id: 4, name: 'Vegetarian'}
  ]
  end
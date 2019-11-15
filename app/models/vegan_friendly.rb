class VeganFriendly < ActiveHash::Base
  self.data = [
      {id: 1, name: 'Vegan'}, {id: 2, name: 'Vegan-Friendly'}, {id: 3, name: 'Vegetarian'},
      {id: 4, name: ' Vegetarian (But Not Vegan-Friendly)'},{id: 5, name:'Vegetarian-Friendly'}
  ]
  end
  class VeganFriendly < ActiveHash::Base
    self.data = [
        {id: 1, name:'Vegetarian-Friendly'},{id: 2, name: ' Vegetarian (But Not Vegan-Friendly)'},{id: 3, name: 'Vegetarian'},
        {id: 4, name: 'Vegan-Friendly'},{id: 5, name: 'Vegan'}
    ]
    end
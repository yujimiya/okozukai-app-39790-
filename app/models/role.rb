class Role < ActiveHash::Base
  self.data = [
    { id: 1, name: '---'},
    { id: 2, name: '親'},
    { id: 3, name: '子供'}
  ]
end
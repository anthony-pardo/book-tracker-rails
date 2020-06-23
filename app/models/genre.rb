class Genre < ApplicationRecord
  has_many :books
  #has_many :users, through: :books 

  validates :name, presence: true
  validates :name, uniqueness: true

end

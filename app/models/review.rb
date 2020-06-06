class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book 
  has_many :comments
  
  validates :content, presence: true
  validates :rating, presence: true


end

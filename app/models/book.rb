class Book < ApplicationRecord
  has_many :reviews 
  has_many :users, through: :reviews 

  validates :title, presence: true

  scope :most_reviews, -> { 
    select("books.id, count(reviews.id) AS reviews_count").
    joins(:reviews).
    group("books.id").
    order("reviews_count DESC").
    limit(1) }

end

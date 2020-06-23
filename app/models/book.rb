class Book < ApplicationRecord
  has_many :reviews 
  has_many :users, through: :reviews 

  validates :title, presence: true

  def user_name
    self.try(:user).try(:name)
  end

  def user_name=(name)
    user = User.find_or_create_by(name: name)
    self.users << user
  end

  scope :most_reviews, -> { 
    select("books.id, count(reviews.id) AS reviews_count").
    joins(:reviews).
    group("books.id").
    order("reviews_count DESC").
    limit(1) }

end

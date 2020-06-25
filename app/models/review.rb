class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book 
  accepts_nested_attributes_for :book
  
  
  validates :rating, presence: true
  validates :rating, inclusion: { in: 1..5 }
  validate :user_cant_review_same_book


  def book_attributes=(book_attributes)
    book_attributes.values.each do |book_attribute|
      book = Book.find_or_create_by(title: book_attribute)
      self.book = book
    end
  end

  scope :positive, -> { where("rating > ?", 3)  }

  scope :negative, -> { where("rating < ?", 4)  }

  private

  def user_cant_review_same_book
    if self.user.books.include?(self.book)
      self.errors[:base] << "You cannot review the same book twice!"
    end
  end
end

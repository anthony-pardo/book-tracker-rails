class Book < ApplicationRecord
  has_many :reviews 
  has_many :users, through: :reviews 
  has_many :genres

  validates :title, presence: true

  def user_name
    self.try(:user).try(:name)
  end

  def user_name=(name)
    user = User.find_or_create_by(name: name)
    self.user = user
  end
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews
  has_many :books, through: :reviews 
  has_many :genres, through: :books 
  has_many :comments

  devise :omniauthable, omniauth_providers: %i[github]
         
end

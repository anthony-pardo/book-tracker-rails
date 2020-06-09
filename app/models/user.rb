class User < ApplicationRecord
  validates :name, uniqueness: true
  validates :email, uniqueness: true
  validates :email, presence: true
  validates :password, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews
  has_many :books, through: :reviews 
  has_many :genres, through: :books 
  has_many :comments
  

  devise :omniauthable, omniauth_providers: %i[github]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.name = auth.info.name   # assuming the user model has a name
      user.email = "#{auth.uid}@github.com"
      user.password = Devise.friendly_token[0,20]
      user.save
      # user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      #user.skip_confirmation!
    end
  end

  scope :most_books, -> { 
    select("users.id, count(books.id) AS books_count").
    joins(:books).
    group("users.id").
    order("books_count DESC").
    limit(1) }
         
end

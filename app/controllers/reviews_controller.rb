class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def index
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      if @user.nil?
        redirect_to users_path, alert: "User not found"
      else
        @reviews = @user.reviews
      end
    else 
      @reviews = Review.all
    end
  end

  def show
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      @review = @user.reviews.find_by(id: params[:id])
      if @review.nil?
        redirect_to user_reviews_path(@user), alert: "Review not found"
      end
    else
      @review = Review.find(params[:id])
    end
  end

  def new
    if params[:user_id] && !User.exists?(params[:user_id])
      redirect_to users_path, alert: "User not found."
    elsif params[:book_id] && !Book.exists?(params[:book_id])
      redirect_to books_path, alert: "Book not found."
    elsif params[:user_id] && current_user == User.find(params[:user_id])
      @review = Review.new(user_id: params[:user_id])
    elsif params[:book_id]
      @review = Review.new(book_id: params[:book_id])
    end
  end

  def create
    @review = Review.new(review_params)
    
    if @review.save
      redirect_to user_review_path(@review)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :user_id, :book_id)
  end
end

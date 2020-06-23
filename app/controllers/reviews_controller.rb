class ReviewsController < ApplicationController
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
    else
      if !params[:user_id]
        @review = Review.new()
      elsif current_user == User.find(params[:user_id])
        @review = Review.new(user_id: params[:user_id])
      else 
        redirect_to root_path
      end
    end
  end

  def create
    @review = Review.new(review_params)
    
    if @review.save
      redirect_to @review
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :user_id, :book_id)
  end
end

class GenresController < ApplicationController
  def index
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      if @user.nil?
        redirect_to users_path, alert: "User not found"
      else
        @genres = @user.genres
      end
    else
      @genres = Genre.all
    end
  end

  def show
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      @genre = @user.genres.find_by(id: params[:id])
      if @genre.nil?
        redirect_to user_genres_path(@user), alert: "Genre not found"
      end
    else
      @genre = Genre.find(params[:id])
    end
  end

  def new
    if params[:user_id] && !User.exists?(params[:user_id])
      redirect_to users_path, alert: "User not found."
    else
      if !params[:user_id]
        @genre = Genre.new()
      elsif current_user == User.find(params[:user_id])
        @genre = Genre.new(user_id: params[:user_id])
      else 
        redirect_to root_path
      end
    end
  end

  def create
    @genre = Genre.new(genre_params)
    
    if @genre.save
      if params[:genre][:user_id] != ""
        @user = User.find(params[:genre][:user_id])
        @genre.users << @user
      end
      redirect_to @genre
    else
      render :new
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name, :user_id, :book_id)
  end
end

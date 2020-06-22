class BooksController < ApplicationController
  def index
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      if @user.nil?
        redirect_to users_path, alert: "User not found"
      else
        @books = @user.books
      end
    else
      @books = Book.all
    end
  end

  def show
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      @book = @user.books.find_by(id: params[:id])
      if @book.nil?
        redirect_to user_books_path(@user), alert: "Book not found"
      end
    else
      @book = Book.find(params[:id])
    end
  end

  def new
    if params[:user_id] && !User.exists?(params[:user_id])
      redirect_to users_path, alert: "User not found."
    else
      if current_user == User.find(params[:user_id])
        @book = Book.new(user_id: params[:user_id])
      else 
        redirect_to root_path
      end
    end
  end

  def create
    @book = Book.new(book_params)
    
    if @book.save
      if params[:book][:user_id] != ""
        @user = User.find(params[:book][:user_id])
        @book.users << @user
      end
      redirect_to @book
    else
      render :new
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :user_id)
  end
end

class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index 
    @users = User.all 
  end

  def show 
    @user = User.find_by(id: params[:id])
  end

  def most_books
    user = User.most_books.as_json
    @user = User.find(user.first["id"])
  end

end

class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def show 
    if params[:id] == 'most_books'
      user = User.most_books.as_json
      @user = User.find(user.first["id"])
      render 'most_books'
    else
      @user = User.find_by(id: params[:id])
    end
  end

end

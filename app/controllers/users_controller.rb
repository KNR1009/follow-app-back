class UsersController < ApplicationController
  def index
    if current_user
      render json: User.all
    else 
      render json: { is_login: false, message: "ユーザーが存在しません" }
    end

  end
end

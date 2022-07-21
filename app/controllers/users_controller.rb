class UsersController < ApplicationController
  def index
    user = User.find(1)
    render json: user.following
  end
end

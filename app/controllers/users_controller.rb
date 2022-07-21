class UsersController < ApplicationController
  def index
    user = User.find(1)
    following = user.active_relationships
    render json: following
  end
end

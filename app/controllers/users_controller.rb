class UsersController < ApplicationController
  def index
    user = User.find(1)
    # ユーザーIDが1のフォローリスト
    active_relationships = user.active_relationships
    followingLists = active_relationships.map{|i| 
      User.find(i.followed_id)
    }
    render json: followingLists
  end
end

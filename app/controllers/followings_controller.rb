class FollowingsController < ApplicationController
  def index
    # ログイン中のユーザーがフォローしているユーザー一覧
    render json: current_user.following
  end

  def create
    following = current_user.active_relationships.new(followed_id: params[:user_id])
    if following.save
      render json: {message: "フォローしました"}
    else 
      errors = following.errors.full_messages.map { |message| { message: message } }
      render json: errors, status: :bad_request
    end
  end

  def destroy
    current_user.active_relationships.find_by(followed_id: params[:id]).destroy
    render json: {message: "削除に成功しました"}
  end
end

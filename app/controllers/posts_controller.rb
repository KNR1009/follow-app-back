class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:index,:create]

  def index
    render json: "aaa"
  end
end

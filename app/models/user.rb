# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  # フォローしているユーザー一覧
  has_many :active_relationships, class_name:  "Relationship", foreign_key: "follower_id"
  has_many :following, through: :active_relationships, source: :followed

  # フォローされているユーザー一覧
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id"
  has_many :follower, through: :passive_relationships, source: :follower
end

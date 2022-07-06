class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  # Userの一覧取得
  def index
    users = User.all
    render json: users
  end

  # Userの追加
  def add
    user = User.create(name: params["name"], age: params["age"])
    render json: user
  end

  # 特定Userの取得
  def user
    user = User.find(params[:id])
    render json: user
  end
end

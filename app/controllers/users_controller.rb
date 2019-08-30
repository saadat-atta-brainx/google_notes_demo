class UsersController < ApplicationController
  def get_users
    @users = User.search_key(params[:q])
    render json: @users
  end
end

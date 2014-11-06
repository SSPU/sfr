class UsersController < ApplicationController

  before_action :current_user, except: :index

  def index
    render json: User.count, status: :ok
  end

  def show
    render json: {user: @current_user}, status: :ok
  end

end

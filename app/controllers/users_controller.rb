class UsersController < ApplicationController

  before_action :current_user

  def show
    render json: {user: @current_user}, status: :ok
  end

end

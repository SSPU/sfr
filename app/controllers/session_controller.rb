class SessionController < ApplicationController

  def signup
    @user = User.new user_params

    if @user.save
      render json: {user: @user, token: @user.token}, status: :created
    else
      render json: {message: @user.errors}, status: :unprocessable_entity
    end
  end

  def signin
    @user = User.authenticate!(params[:email], params[:password])

    if @user
      render json: {user: @user, token: @user.token}, status: :ok
    else
      render json: {message: 'incorrect email or password'}, status: :forbidden
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end

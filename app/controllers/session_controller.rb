class SessionController < ApplicationController

  def signup
    @user = User.new user_params

    respond_to do |format|
      if @user.save
        format.json {render json: @user, status: :created}
      else
        format.json {render json: @user.errors, status: :unprocessable_entity}
      end
    end
  end

  def signin
    @user = User.authenticate!(params[:email], params[:password])

    respond_to do |format|
      if @user
        format.json {render nothing: true, status: :ok}
      else
        format.json {render nothing: true, status: :forbidden}
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end

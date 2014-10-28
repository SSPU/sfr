class UsersController < ApplicationController
  respond_to    :json

  def show
    respond_with current_user
  end

  private

  def current_user
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end

end

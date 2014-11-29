class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  protect_from_forgery
  skip_before_action :verify_authenticity_token, if: :json_request?

  respond_to :json, :html

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def current_user
    @current_user = nil

    if ! request.headers['ut']
      json_require_login
      return
    end

    u = User.find params[:id]

    if u.token.token != request.headers['ut']
      json_require_login
      return
    end

    if Time.now > u.token.expire
      render json: {message: 'token expired'}, status: :forbidden
      return
    end

    @current_user = u
  end

  def current_admin
    @current_admin = nil
    if session[:admin]
      @current_admin = session[:admin]
    else
      redirect_to admin_login_path, notice: 'Require admin login'
    end
  end

  protected

  def json_request?
    request.format.json?
  end

  def json_require_login
    render json: {message: 'require user to login'}, status: :forbidden
  end

  def record_not_found
    render json: {message: 'not found'}, status: :not_found
  end

end

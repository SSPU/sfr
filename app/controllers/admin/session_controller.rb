class Admin::SessionController < ApplicationController

  def login
    @admin = Admin.new
  end

  def auth
    @admin = Admin.authenticate!(params[:admin][:name], params[:admin][:password])
    if @admin
      session[:admin_id] = @admin.id
      redirect_to admin_products_path, notice: "Welcome back, #{@admin.name}"
    else
      redirect_to admin_login_path, notice: 'Invalid admin name or password'
    end
  end

end

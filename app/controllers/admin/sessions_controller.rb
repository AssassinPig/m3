class Admin::SessionsController < Admin::ApplicationController
  def new 
  end

  def create 
    user=User.authenticate(params[:username], params[:password]) 
    if user.nil?
      flash.now[:warning] = "name or password invalidate"
      render :new
    else
      flash.now[:success] = "login success"
      login user
      redirect_to admin_root_path
    end
  end

  def destroy
    logout
    redirect_to admin_login_path 
  end
end

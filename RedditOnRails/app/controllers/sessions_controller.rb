class SessionsController < ApplicationController

  def create
    @user = User.find_by_credentials(user_params[:username], user_params[:password])

    if @user
      login!(@user)
      flash[:messages] = ["Welcome Back!"]
      redirect_to user_url(@user)
    else
      flash.now[:errors] = ["Invalid credentials"]
      render :new
    end
  end

  def new
    render :new
  end

  def destroy
    logout!
    redirect_to new_session_url
  end


end

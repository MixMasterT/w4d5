class UsersController < ApplicationController

  def show
    @user = User.find_by(id: params[:id])
    render :show
  end

  def new
    #why @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end


  private


end

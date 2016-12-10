class SubsController < ApplicationController

  def index
    @subs = Sub.all
  end

  def new
    @sub = Sub.new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator_id = current_user.id
    if @sub.save
      redirect_to subs_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end


  def show
    @posts = Post.where(sub_id: params[:id])
    @sub = Sub.find_by(id: params[:id])
  end

  def edit
    @sub = Sub.find_by(id: params[:id])
  end

  def update
    @sub = Sub.find_by(id: params[:id])
    if @sub.update
      redirect_to subs_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def destroy
    sub = @sub.find_by(id: params[:id])
    sub.destroy
    redirect_to subs_url
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end

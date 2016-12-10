class PostsController < ApplicationController

  def new
    @post = Post.new
    @subs = Sub.all
  end

  def create
    @post = Post.new(post_params)
    redirect_to sub_url(@post.sub)
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def edit
    @post = Post.find_by(id: params[:id])
    @subs = Sub.all
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.update
      redirect_to sub_url(@post.author)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def destroy
    post = Post.find_by(id: params[:id])
    flash[:messages] = ["#{post.title} deleted!"]
    post.destroy
    redirect_to subs_url
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content, :sub_id)
  end

end

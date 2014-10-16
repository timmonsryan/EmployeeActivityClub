class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(post_params)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  end

  private
    def post_params
      params.require(:post).permit(:title, :subject, :user_id)
    end
end

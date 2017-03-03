class PostsController < ApplicationController
  def index
    authorize Post.new
    @posts = Post.includes(:comments).order({ created_at: :desc })
  end

  def new
    authorize Post.new
  end

  def create
    new_post = Post.new(create_params)
    new_post.user = current_user

    authorize new_post

    new_post.save!

    redirect_to posts_url
  end

  def show
    @post = Post.preload(:comments).find(params[:id])
    authorize @post
  end

  protected

  def create_params
    params.require(:post).permit(:title, :body)
  end
end

class PostsController < ApplicationController
  load_and_authorize_resource only: [:new, :edit, :update, :destroy]

  def index
    @posts = Post.paginate(page: params[:page])
  end

  def new
  end

  def create
    @post = Post.new(create_params)
    @post.user = current_user

    authorize! :create, @post

    if @post.save
      flash[:success] = 'Post created successfully.'
      redirect_to posts_url
    else
      flash.now[:error] = @post.errors.full_messages.to_sentence
      render :new
    end
  end

  def show
    @post = Post.includes(:user, comments: [:user, :children, :parent]).find(params[:id])

    authorize! :show, @post
  end

  def edit
  end

  def update
    if @post.update_attributes(update_params)
      flash[:success] = 'Post updated successfully.'
      redirect_to post_url(@post)
    else
      flash.now[:error] = @post.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @posts = Post.paginate(page: params[:page])

    if @post.destroy
      respond_to do |f|
        f.html do
          flash[:success] = 'Post deleted successfully.'
          redirect_to(posts_url)
        end
        f.xml  { head :ok }
        f.js do
          flash.now[:success] = 'Post deleted successfully.'
          render 'posts.js.erb'
        end
      end
    else
      respond_to do |f|
        f.html do
          flash[:error] = @post.errors.full_messages.to_sentence
          redirect_to(posts_url)
        end
        f.xml  { head :ok }
        f.js do
          flash.now[:error] = @post.errors.full_messages.to_sentence
          render 'posts.js.erb'
        end
      end

    end
  end

  protected

  def create_params
    params.require(:post).permit(:title, :body, :post_id)
  end

  def update_params
    params.require(:post).permit(:title, :body, :post_id)
  end
end

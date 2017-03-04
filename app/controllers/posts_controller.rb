class PostsController < ApplicationController
  load_and_authorize_resource only: [:new, :show, :edit, :update, :destroy]

  def index
    @posts = Post.paginate(page: params[:page])
  end

  def new
  end

  def create
    new_post = Post.new(create_params)
    new_post.user = current_user

    authorize! :create, new_post

    if new_post.save!
      redirect_to posts_url
    else
      debugger
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update_attributes(update_params)
      redirect_to post_url(post)
    else
      debugger
    end
  end

  def destroy
    if @post.destroy
      @posts = Post.paginate(page: params[:page])

      respond_to do |f|
        f.html { redirect_to(posts_url) }
        f.xml  { head :ok }
        f.js   { render 'posts.js.erb' }
      end
    else
      debugger
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

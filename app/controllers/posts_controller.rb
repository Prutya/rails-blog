class PostsController < ApplicationController
  def index
    # authorize Post.new
    load_posts
  end

  def new
    # authorize Post.new
  end

  def create
    new_post = Post.new(params_create)
    new_post.user = current_user

    # authorize new_post

    new_post.save!

    redirect_to posts_url
  end

  def show
    @post = Post.preload(:comments).find(params[:id])
    # authorize @post
  end

  def edit
    @post = Post.find(params[:id])
    # authorize @post
  end

  def update
    post = Post.find(params[:id])
    # authorize post
    post.update_attributes(params_update)

    redirect_to post_url(post)
  end

  def destroy
    @post = Post.find(params[:id])
    # authorize
    @post.destroy!

    load_posts

    respond_to do |f|
      f.html { redirect_to(posts_url) }
      f.xml  { head :ok }
      f.js   { render 'posts.js.erb' }
    end
  end

  protected

  def params_create
    params.require(:post).permit(:title, :body)
  end

  def params_update
    params.require(:post).permit(:title, :body)
  end

  def load_posts
    @posts = Post.includes(:comments).order({ created_at: :desc })
  end
end

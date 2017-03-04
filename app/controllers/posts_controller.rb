class PostsController < ApplicationController
  def index
    # authorize Post.new
    load_posts
  end

  def new
    # authorize Post.new
  end

  def create
    new_post = Post.new(create_params)
    new_post.user = current_user

    # authorize new_post

    new_post.save!

    redirect_to posts_url
  end

  def show
    @post = Post.preload(:comments).find(params[:id])
    # authorize @post
  end

  def destroy
    @post = Post.find(params[:id])
    # authorize
    @post.destroy!

    load_posts

    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
      format.js { render 'posts.js.erb' }
    end
  end

  protected

  def create_params
    params.require(:post).permit(:title, :body)
  end

  def load_posts
    @posts = Post.includes(:comments).order({ created_at: :desc })
  end
end

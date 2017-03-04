class CommentsController < ApplicationController
  def create
    new_comment = Comment.new(params_create)
    post = Post.find(params[:post_id])

    # authorize new_comment

    if !post.nil?
      new_comment.user = current_user
      post.comments << new_comment
    else
      # Warn user
    end

    redirect_to(post_url(params[:post_id]))
  end

  def destroy
    @comment = Comment.find(params[:id])

    # authorize

    @comment.destroy!

    load_comments(params[:post_id])

    respond_to do |f|
      f.html { redirect_to(posts_url(params[:post_id]) }
      f.xml  { head :ok }
      f.js   { render 'comments.js.erb' }
    end
  end

  protected

  def load_comments(post_id)
    @comments = Post.find(post_id).comments
  end

  def params_create
    params.require(:comment).permit(:body)
  end
end

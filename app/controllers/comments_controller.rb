class CommentsController < ApplicationController
  def create
    new_comment = Comment.new(params_create)
    post = Post.find(params[:post_id])

    if !post.nil?
      new_comment.user = current_user
      post.comments << new_comment
    else
      # Warn user
    end

    redirect_to(post_url(params[:post_id]))
  end

  def delete
  end

  protected

  def params_create
    params.require(:comment).permit(:body)
  end
end

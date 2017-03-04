class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    post = Post.find(params[:post_id])
    new_comment = Comment.new(create_params)
    new_comment.user = current_user
    new_comment.post = post

    authorize! :create, new_comment

    if new_comment.save
      redirect_to(post_url(params[:post_id]))
    else
      debugger
    end
  end

  def edit
  end

  def update
    if @comment.update_attributes(update_params)
      redirect_to post_url(@comment.post_id)
    else
      debugger
    end
  end

  def destroy
    if @comment.destroy
      load_comments(params[:post_id])

      respond_to do |f|
        f.html { redirect_to posts_url(params[:post_id]) }
        f.xml  { head :ok }
        f.js   { render 'comments.js.erb' }
      end
    else
      debugger
    end
  end

  protected

  def create_params
    params.require(:comment).permit(:body)
  end

  def update_params
    params.require(:comment).permit(:body)
  end

  def load_comments(post_id)
    @comments = Post.find(post_id).comments
  end
end

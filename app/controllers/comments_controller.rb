class CommentsController < ApplicationController
  load_and_authorize_resource only: [:edit, :update, :destroy]

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(create_params)
    @comment.user = current_user
    @comment.post = post

    authorize! :create, @comment

    if @comment.save
      flash[:success] = 'Comment created successfully.'
      redirect_to(post_url(params[:post_id]))
    else
      flash[:error] = @comment.errors.full_messages.to_sentence
      render action: :new
    end
  end

  def edit
  end

  def update
    if @comment.update_attributes(update_params)
      flash[:success] = 'Comment updated successfully.'
      redirect_to post_url(@comment.post_id)
    else
      flash[:error] = @comment.errors.full_messages.to_sentence
      render action: :edit
    end
  end

  def destroy
    if @comment.destroy
      @comments = Post.find(params[:post_id]).comments.paginate(page: params[:page])

      respond_to do |f|
        f.html do
           flash[:success] = 'Comment deleted successfully.'
           redirect_to posts_url(params[:post_id])
        end
        f.xml  { head :ok }
        f.js   { render 'comments.js.erb' }
      end
    else
      flash[:error] = @comment.errors.full_messages.to_sentence
    end
  end

  protected

  def create_params
    params.require(:comment).permit(:body)
  end

  def update_params
    params.require(:comment).permit(:body)
  end
end

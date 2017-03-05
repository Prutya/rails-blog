class CommentsController < ApplicationController
  load_and_authorize_resource only: [:edit, :update, :destroy]

  def create
    @post = Post.find(params[:post_id])

    @comment = Comment.new(create_params)

    #debugger

    if (create_params[:parent_id])
      @parent = Comment.find(create_params[:parent_id])
      @comment.parent = @parent
    end

    @comment.user = current_user
    @comment.post = @post

    authorize! :create, @comment

    if @comment.save
      flash[:success] = 'Comment created successfully.'
    else
      flash[:error] = @comment.errors.full_messages.to_sentence
    end

    redirect_to(post_url(params[:post_id]))
  end

  def edit
  end

  def update
    if @comment.update_attributes(update_params)
      flash[:success] = 'Comment updated successfully.'
      redirect_to post_url(@comment.post_id)
    else
      flash.now[:error] = @comment.errors.full_messages.to_sentence
      render action: :edit
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    if @comment.destroy
      @comments = @post.comments.paginate(page: params[:page])

      respond_to do |f|
        f.html do
           flash[:success] = 'Comment deleted successfully.'
           redirect_to post_url(@post)
        end
        f.xml  { head :ok }
        f.js do
          flash.now[:success] = 'Comment deleted successfully.'
          render 'comments.js.erb'
        end
      end
    else
      @comments = @post.comments.paginate(page: params[:page])

      respond_to do |f|
        f.html do
           flash[:error] = @comment.errors.full_messages.to_sentence
           redirect_to post_url(@post)
        end
        f.xml  { head :ok }
        f.js do
          flash.now[:error] = @comment.errors.full_messages.to_sentence
          render 'comments.js.erb'
        end
      end
    end
  end

  protected

  def create_params
    params.require(:comment).permit(:body, :parent_id)
  end

  def update_params
    params.require(:comment).permit(:body)
  end
end

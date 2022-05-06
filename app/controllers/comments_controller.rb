class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @current_user = current_user
    @user = User.find(params[:user_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(Text: comment_params[:Text], author_id: current_user.id, post_id: @post.id)

    if @comment.save
      flash[:notice] = 'Comment has been created successfully'
      redirect_to user_posts_path(@comment.author.id)
    else
      flash[:alert] = 'The comment adding failed.'
      render :_comment_form, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:Text).tap do |comment_params|
      comment_params.require(:Text)
    end
  end
end

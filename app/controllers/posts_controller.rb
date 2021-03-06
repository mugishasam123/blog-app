class PostsController < ApplicationController
  load_and_authorize_resource

  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @user = User.includes(:posts).find(params[:user_id])
    @current_user = current_user
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.includes(:comments, :likes).find(params[:id])
    @like = Like.new
  end

  def new
    @post = Post.new
    @current_user = current_user
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.LikesCounter = 0
    @post.CommentsCounter = 0

    if @post.save

      redirect_to user_posts_path(@post.author_id), success: 'The post have been created successfully'
    else

      render :new, status: :unprocessable_entity, info: 'Adding a new post failed.'
    end
  end

  def destroy
    post = Post.find(params[:id])
    user = User.find(post.author_id)
    user.PostsCounter -= 1
    post.destroy
    user.save
    flash[:alert] = 'You have deleted this post successfully!'
    redirect_to user_posts_path(post.author_id)
  end

  private

  def post_params
    params.require(:post).permit(:author_id, :Title, :Text).tap do |post_params|
      post_params.require(:Text)
    end
  end
end

class CommentsController < ApplicationController

  before_action :find_comment, only: [:edit, :update, :destroy]
  before_action :authorized
  def new
      @user = User.find_by(id: session[:user_id])
      @is_like = IsLike.find(params[:id])
      @comment = Comment.new
      
  end

  def create
    @comment = Comment.create(comment_params(:user_id, :is_like_id, :comment_body))
    redirect_to is_like_path(@comment.is_like_id)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private 

  def comment_params(*args)
    params.require(:comment).permit(*args)
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end


end

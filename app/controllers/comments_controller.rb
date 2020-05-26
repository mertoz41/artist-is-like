class CommentsController < ApplicationController

  before_action :find_comment, only: [:edit, :update, :destroy]

  def new
      @user = User.find_by(user_name: session[:user_name])
      @is_like = IsLike.find(params[:id])
      @comment = Comment.new
      
  end

  def create
    byebug
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

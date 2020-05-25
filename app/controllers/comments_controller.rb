class CommentsController < ApplicationController

  before_action :find_comment, only: [:edit, :update, :destroy]

  def new
      @comment = Comment.new
  end

  def create
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

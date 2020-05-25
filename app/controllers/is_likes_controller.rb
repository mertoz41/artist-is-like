class IsLikesController < ApplicationController
  def index
    @is_likes = IsLike.all
  end

  def show
    @is_like = IsLike.find(params[:id])
    end

  def new
      @is_like = IsLike.new
  end

  def create
    @is_like = IsLike.new(like_params)
      if @is_like.valid?
        @is_like.save
          redirect_to is_like_path(@is_like)
      else
          render :new
      end
  end

  private

  def like_params
      params.require(:is_like).permit(:liker_id, :liked_id)
  end

  # def find_id
  #     @is_like = IsLike.find(params[:id])
  # end



end

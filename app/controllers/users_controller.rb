class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_name] = params[:user][:user_name]
      redirect_to user_path(@user)
    else
      @user
      render :new
    end
  end



  private

  def user_params
  params.require(:user).permit(:first_name, :last_name, :user_name, :password, :password_confirmation)
  end

end

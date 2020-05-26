class SessionsController < ApplicationController

  def new  
  end  

  def create
    user = User.find_by(user_name: params[:user][:user_name]).try(:authenticate, params[:user][:password])
    if user  
    session[:user_name] = user.user_name 
    redirect_to artists_path
    else 
      flash[:error_message] = "Invalid username or password" 
      redirect_to login_path
    end 
  end 

  def destroy    
    session.clear
    redirect_to login_path  
  end
end

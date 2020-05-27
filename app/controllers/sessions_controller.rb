class SessionsController < ApplicationController

  def new  
  end  

  def create
    username = params[:user_name]
    password = params[:password]
    user = User.find_by(user_name: username)
  
    if user && user.authenticate(password)
      session[:user_id] = user.id
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

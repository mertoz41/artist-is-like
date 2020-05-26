class SessionsController < ApplicationController

  def new  
  end  
  
  def create    
    session[:user_name] = params[:user_name]    
    redirect_to artists_path
  end 

  def destroy    
    session.delete :user_name  
  end

end

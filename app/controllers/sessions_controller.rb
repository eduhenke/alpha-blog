class SessionsController < ApplicationController
  
  def new #display form
    
  end
  
  def create #handle form and login
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Logged in!"
      redirect_to user_path(user)
    else
      flash.now[:danger] = "There was something wrong with your login information"
      render 'new'
    end
  end
  
  def destroy #logout
    session[:user_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end
  
end
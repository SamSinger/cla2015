class SessionsController < ApplicationController
  def new
    
  end

  def create
    user = User.find_by(au_user_name: params[:username])
    #binding.pry
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "You've logged in!"
      redirect_to root_path
    else
      flash[:error] = "There is something wrong with your username or password."
      redirect_to register_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You are logged out."
    redirect_to register_path
  end
end
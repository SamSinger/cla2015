class UsersController < ApplicationController

  #before_action :require_user, except: [:login]

  def index

    @users = User.all
    
    
  end

  def show
    @user = User.find(params[:id])
     #render json: @user


  end

  def new
    @user = User.new
    
  end

  def create
    @user = User.new(user_params)
    binding.pry
    if @user.save
      redirect_to sign_in_path
    else
      render :new
    end
  end 

  def edit
    @user = User.find(params[:id])
  end

  def update
     #params[:user][:category_ids] ||= []
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      AppMailer.welcome_email(@user).deliver
      flash[:notice] = "Your user profile was updated."
      redirect_to user_path
    else
      render 'edit'
    end
  end

  def delete
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id]).destroy
    flash[:notice] = "'{@user.last_name, @user.first_name}' destroyed successfully."
    redirect_to(:action => 'index')
  end

  def search
    @results = User.search_by_last_name(params[:search_term])
  end

  private

  def user_params    
    params.require(:user).permit(:au_user_name, :password, :first_name, :middle_name, :last_name, 
      :email, :category_ids, :department_id)
  end


end
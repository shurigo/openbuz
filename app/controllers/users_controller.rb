class UsersController < ApplicationController
  
  def new
    @title = "Sign Up"
  end
  
  def show
    @user = User.find(params[:id])
    @title = @user.name
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @usesr = User.new(params[:user])
    if @user.save
      flash[:success] = 'Welcome to OpenBuz'
      redirect_to @user 
    else
      render 'new'
    end
  end
end

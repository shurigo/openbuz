class UsersController < ApplicationController
  
  def new
    @title = "Sign Up"
    @user = User.new
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
      # Success
    else
      render 'new'
    end
  end
end

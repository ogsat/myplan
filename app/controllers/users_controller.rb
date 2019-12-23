class UsersController < ApplicationController
  def index

  end
  
  def new
    
  end
  
  def create
    @user = User.new(name:params[:name],email: params[:email])
    @user.save
    redirect_to("/posts/index")
  end
  
  def index
    @users = User.all.order(created_at: :desc)
  end
  
  def show
    @user = User.find_by(id: params[:id])
  end
  
  def edit
    @user = User.find_by(id: params[:id])
  end
  
  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.save
    redirect_to("/users/index")
  end
  
  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    redirect_to("/users/index")
  end
end

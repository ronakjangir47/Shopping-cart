class UsersController < ApplicationController
  
  def index 
    @users = User.order(:name)
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])

    respond_to do |format|

      if @user.save 
        format.html { redirect_to(users_path, :notice => "User #{@user.name} Created Successfully!" )}
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update

    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(users_path, notice: "User #{@user.name} Successfully upadated!")  }
      else
        format.html { render action: 'edit' }
      end
    end
  end
end

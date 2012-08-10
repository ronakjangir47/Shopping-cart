class SessionsController < ApplicationController
  skip_before_filter :authorize

  def new

  end
  def create 
    if (user = User.authenticate(params[:name], params[:password])) || User.count.zero? 
      message = "Welcome Admin"
      unless user  
        user = User.create(name: 'fake', password: 'fake', password_confirmation: 'fake') 
        message = "Your user name and password both are 'fake' change them imidiately! "
      end
      session[:user_id] = user.id
      redirect_to admin_path, notice: message
    else
      redirect_to login_path, :alert => "Invalid User/password combination" 
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, :notice => "Logged Out!" 
  end

end

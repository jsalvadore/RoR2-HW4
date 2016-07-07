class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(username: params[:user][:username])
  	password = params[:user][:password]
  	if user && user.authenticate(password)
  		session[:user_id] = user.id
  		redirect_to root_path, notice: 'Login Successful'
  	else
  		redirect_to login_path, alert: 'Incorrect Password'
  	end
  end

  def destroy
  	reset_session
	redirect_to login_path, notice: 'You have been logged out'
  end
end

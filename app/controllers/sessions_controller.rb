class SessionsController < ApplicationController


  def new
  end

  def create
  	user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
  		flash[:notice] = "Welcome, #{user.email}!"
  		redirect_to statuses_path  		
  	else	
  		flash[:alert] = "Please log in again"
  		render :new
  	end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def sessions_params
    params.require(:session).permit(:email, :password, :name)
  end


end

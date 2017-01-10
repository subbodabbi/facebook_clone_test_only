class UsersController < ApplicationController
before_action :find_user, only: [:edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  	if @user.save
  	  flash[:notice] = "Account created. Please log in now."
      redirect_to user_path(User.last.id)
  	else
  	  flash[:alert] = "Error creating account: "  
  	  render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Account is updated successfully."
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
  	@user = User.find(params[:id]).destroy
  	flash[:notice] = "Account is deleted"
  	redirect_to statuses_path
  end

  def find_user
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end

end

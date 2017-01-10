class LikesController < ApplicationController

  def create
    @like = Like.new(user_id: params[:like][:user], status_id: params[:like][:status])
    if @like.save
	  flash[:notice] = "You liked #{@like.status.title}!"
      redirect_to root_path
	else
	  flash[:alert] = "You liked before!"		
	  redirect_to root_path
	end  
  end

  def destroy
  	@like = Like.find(params[:id]).destroy
	flash[:notice] = "You unlike."
	redirect_to status_path(@like.status.id)		
  end

end

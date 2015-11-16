class LikesController < ApplicationController
  before_action :authenticate_user

  def create
    idea                      = Idea.find(params[:idea_id])
    like                      = Like.new
    like.idea                 = idea
    like.user                 = current_user
    if like.save
      # flash[:notice] = "Liked"
    else
      flash[:danger] = "Something went wrong liking this idea."
    end
    # TODO: redirect_to back if it worked, for the home page
    redirect_to idea
  end

  def destroy
    idea                      = Idea.find(params[:idea_id])
    current_user.likes.find(params[:id]).destroy
    # flash[:notice] = "Unliked"
    redirect_to idea
  end
end

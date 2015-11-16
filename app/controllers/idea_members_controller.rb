class IdeaMembersController < ApplicationController
  before_action :authenticate_user

  def create
    idea                      = Idea.find(params[:idea_id])
    idea_membership           = IdeaMember.new
    idea_membership.idea      = idea
    idea_membership.user      = current_user
    if idea_membership.save
      flash[:notice] = "Joined idea"
    else
      flash[:danger] = "Something went wrong joining this idea."
    end
    redirect_to idea
  end

  def destroy
    idea                      = Idea.find(params[:idea_id])
    current_user.idea_members.find(params[:id]).destroy
    flash[:notice] = "You left this idea"
    redirect_to idea
  end
end

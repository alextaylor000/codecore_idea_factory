class IdeasController < ApplicationController

  def new
    authenticate_user
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    @idea.user = current_user
    if @idea.save
      redirect_to @idea, notice: "Idea submitted!"
    else
      render :new
    end
  end

  def index
    @ideas = Idea.all_by_date
  end

  def show
    @idea ||= Idea.find(params[:id])
    @comment = @idea.comments.new
  end

  def edit
    @idea = current_user.ideas.find(params[:id])
  end

  def update
    @idea ||= Idea.find(params[:id])
    if @idea.update(idea_params)
      redirect_to @idea, notice: "Idea updated"
    else
      render :edit
    end
  end

  def destroy
    @idea = current_user.ideas.find(params[:id])
    if @idea
      @idea.destroy
      redirect_to root_path, notice: "Idea deleted"
    else
      flash[:danger] = "error deleting idea"
      redirect_to @idea_path
    end
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :description, :image)
  end
end

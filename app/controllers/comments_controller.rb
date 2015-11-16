class CommentsController < ApplicationController
  def create
    @idea = Idea.find(params[:idea_id])
    @comment = @idea.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @idea, notice: "Comment posted"
    else
      render "ideas/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end

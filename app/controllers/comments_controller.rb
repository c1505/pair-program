class CommentsController < ApplicationController

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.event_id = params[:event_id]
    @comment.save
    # @comment = current_user.comments.build(comment_params.merge(:event_id => params[:event_id]))
    #            Comment.new_for_user_and_event(current_user, params[:event_id], comment_params)

    event = @comment.event 
    redirect_to event 
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end
end

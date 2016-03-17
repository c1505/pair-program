class CommentsController < ApplicationController
  def index
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.save
    binding.pry

    event = @comment.event 
    redirect_to event 
    # not currently working
    # not sure how to do current user.  
    # i don't want to have to redirect because i want the comment to just show up, but i will for now
  end

  def edit
    comment = Comment.find(params[:id])
  end

  def update
    comment = Comment.find(params[:id])
    comment.update(comment_params)
    event = comment.event 
    redirect_to event 
    # i don't want to have to redirect because i want the comment to just show up, but i will for now

  end

  private

    def comment_params
      params.require(:comment).permit(:user_id, :event_id, :content)
    end
end

class TagsController < ApplicationController
  def show
    @tags = Tag.all
    @tag = Tag.find(params[:id])
    respond_to do |format|
      format.html {render :show}
      format.json {render json: @tag}
    end
  end

  def index
    if params[:exercism_id]
      @tags = Tag.joins(:events).where(events: { id: params[:exercism_id]})
    else
      @tags = Tag.all
    end
    respond_to do |format|
      format.html {render :index}
      format.json {render json: @tags}
    end
  end

  def create
    event = Event.find(params[:event_id])
    tag = Tag.where(name: params[:tag][:name]).first_or_create!
    event.tags << tag
    event.save
    render json: tag
  end

end
class TagsController < ApplicationController
  def show
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
    tag = Tag.new(name: params[:tag][:name])
    # event.tags.build(name: params[:tag][:name])
    event.tags << tag
    event.save
    render json: tag
  end

end
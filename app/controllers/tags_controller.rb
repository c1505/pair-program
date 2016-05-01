class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    respond_to do |format|
      format.html {render :show}
      format.json {render json: @tag}
    end
  end

  def index
    @tags = Tag.all
  end

end
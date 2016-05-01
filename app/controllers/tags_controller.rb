class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    render json: @tag
  end

  def index
    @tags = Tag.all
  end

end
class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def show
    @user = User.find(params[:id])
    # render json: @user
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @user}
    end
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :slack, :github, :twitter, :website, :bio, :availability, :application)
    end
end

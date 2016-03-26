class UsersController < ApplicationController
  def show
    if current_user
      @user = User.find(params[:id])
    else
      flash[:notice] = "You must be logged in to view a user"
      redirect_to new_user_session_path
    end
  end

  def index
    # if current_user
      @users = User.all
    # else
    #   flash[:notice] = "You must be logged in to view users"
    #   redirect_to new_user_session_path
    # end 
  end

  def edit
    if current_user
      @user = User.find(params[:id])
    else
      redirect_to new_user_session_path
    end
  end

  def update
    @user = User.find(params[:id])
    if current_user == @user
      if @user.update(user_params)
        redirect_to @user
      else
        render 'edit'
      end
    else
      flash[:error] = "Error!"
      redirect_to root_path
    end 
  end

  private

    def user_params
      params.require(:user).permit(:name, :slack, :github, :twitter, :website, :bio, :availability, :application)
    end
end

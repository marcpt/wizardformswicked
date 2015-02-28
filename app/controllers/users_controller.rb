class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_steps_path
    else
      render :new
    end
  end

  private

  def user_params
    params[:user].permit(:email, :password_digest, :name, :twitter_username, :github_username, :website, :date_of_birth, :bio)
  end
end

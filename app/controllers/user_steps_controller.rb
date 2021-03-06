class UserStepsController < ApplicationController
  include Wicked::Wizard
  steps :personal, :social

  def show
    @user = current_user
    render_wizard
  end

  def update
    @user = current_user
    @user.attributes = user_params
    render_wizard @user
  end


  private

  def redirect_to_finish_wizard(options = nil)
    redirect_to root_url, notice: "Thank you for signing up."
  end

  def user_params
    params[:user].permit(:email, :password_digest, :name, :twitter_username, :github_username, :website, :date_of_birth, :bio)
  end
end

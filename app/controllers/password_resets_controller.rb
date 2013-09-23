class PasswordResetsController < ApplicationController
  def new
  end

  def create
  	@user = User.find_by_email(params[:email])
  	@user.send_password_reset if @user
  	redirect_to(root_url)
  	flash[:success] = "Email sent"
  end

  def edit
  	@user = User.find_by_password_reset_token!(params[:id])
  end

  def update
  	@user = User.find_by_password_reset_token!(params[:id])
  	if @user.password_reset_sent_at < 2.hours.ago
  		redirect_to new_password_path
  		flash[:error] = "Password reset has expired"
  	elsif @user.update_attributes(permitted_params)
  		redirect_to signin_path
  		flash[:success] = "Password reset complete"
  	else
  		render :edit
  	end
  end

  private
    def permitted_params
      params.require(:user).permit(:password,:password_confirmation)
    end
end

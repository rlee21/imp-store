class UsersController < ApplicationController
  before_action :set_user, only: [:show, :giveaway]

  def index
    @users = User.all
  end

  def show
  end

  def giveaway
    reset_giveaway_winner
    if @user.update(giveaway_winner: true)
      flash[:success] = "User was successfully selected as the Giveaway Winner!"
      redirect_to @user
    else
      flash[:error] = "ERROR: User was NOT successfully updated."
      redirect_to @user
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :admin)
    end

    def reset_giveaway_winner
      User.where(giveaway_winner: true).update(giveaway_winner: false)
    end
end

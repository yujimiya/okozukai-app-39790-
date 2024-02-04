class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  def edit
  end

  def update
    if @user.update(users_params)
      redirect_to events_path
    else
      redirect_to events_path, alert: "Failed to update user"
    end
  end

  private
  def set_user
    @user = current_user
  end

  def users_params
    params.require(:user).permit(:nickname, :email, :goal_price, :unit_price)
  end
end

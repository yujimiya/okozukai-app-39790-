class UsersController < ApplicationController

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def goal_price
    self.goal_price ||= 0
  end

  private

  def users_params
    params.require(:user).permit(:nickname, :email, :goal_price)
  end
end

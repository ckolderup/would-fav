class UsersController < ApplicationController
  def show
    @user = User.friendly.find(user_params)

    render
  end

  private

  def user_params
    params.require(:name)
  end
end

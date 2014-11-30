class UsersController < ApplicationController
  def show
    @user = User.find_by_name(user_params)

    render
  end

  private

  def user_params
    params.require(:name)
  end
end

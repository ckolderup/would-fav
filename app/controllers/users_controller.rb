class UsersController < ApplicationController
  def show
    @user = User.friendly.find(user_params)

    collections = @user.collections.all
    @visible_collections = collections.select {|c| c.visible_to?(current_user)}
    render
  end

  private

  def user_params
    params.require(:name)
  end
end

class SessionsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) ||
           User.create_with_omniauth(auth)
    cookies.permanent.signed[:user_id] = user.uid
    redirect_to show_path, notice: 'Signed in'
  end

  def show
    if current_user
      @twitter_user = client.user(include_entities: true)
    else
      redirect_to failure_path
    end
  end

  def error
    flash[:error] = 'Sign in with Twitter failed'
    redirect_to root_path
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'Signed out'
  end
end

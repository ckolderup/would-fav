class WelcomeController < ApplicationController
  def index
    if current_user
      redirect_to show_path
    end


  end
end

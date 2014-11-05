class WelcomeController < ApplicationController
  skip_before_action :authenticate, only: [:index, :signin]


  def index
  end

  def signin

    user = User.find_by name: params[:name]

    if user
      session[:user_id] = user.id
      flash[:notice] = "Congrats, you signed in!"
    else
      session[:user_id] = nil
      flash[:error] = "No user name found"
    end
    redirect_to super_heros_path

  end

  def signout
    session[:user_id] = nil
    flash[:warning] = "YOU SIGNED OUT!"
    redirect_to root_path
  end


end
